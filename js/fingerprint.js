const base = 'a'.charCodeAt(0);

export default class Fingerprint {
  static build(string) {
    const values = [];

    var string = string.toLowerCase();

    for (var i = 0; i < string.length; i++) {
      const bit = 2 ** (string.charCodeAt(i) - base);

      var level = 0;
      while (true) {
        if (values.length == level) {
          values[level] = 0;
        }

        if ((values[level] & bit) == 0) {
          values[level] |= bit;
          break;
        }

        level++;
      }
    }

    return values;
  }

  static includes(mask, other) {
    for (var i = 0; i < other.length; i++) {
      if (mask.length == i) {
        return false;
      }

      if ((mask[i] | other[i]) != mask[i]) {
        return false
      }
    }

    return true;
  }
}

