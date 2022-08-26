const base = 'a'.charCodeAt(0);

export default class Fingerprint {
  constructor(string) {
    this.values = [];

    var string = string.toLowerCase();

    for (var i = 0; i < string.length; i++) {
      const bit = 2 ** (string.charCodeAt(i) - base);

      var level = 0;
      while (true) {
        if (this.values.length == level) {
          this.values[level] = 0;
        }

        if ((this.values[level] & bit) == 0) {
          this.values[level] |= bit;
          break;
        }

        level++;
      }
    }
  }

  includes(other) {
    for (var i = 0; i < other.values.length; i++) {
      if (this.values.length == i) {
        return false;
      }

      if ((this.values[i] | other.values[i]) != this.values[i]) {
        return false
      }
    }

    return true;
  }
}

