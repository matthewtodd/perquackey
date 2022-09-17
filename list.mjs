export default class List {
  constructor(words) {
    this._columns = {};

    for (const word of words) {
      this._columns[word.length] ||= [];
      this._columns[word.length].push(word);
    }

    this.min = Math.min.apply(null, Object.keys(this._columns));
    this.max = Math.max.apply(null, Object.keys(this._columns));
  }

  get headers() {
    const result = [];
    for (var i = this.min; i <= this.max; i++) {
      result.push(String(i));
    }
    return result;
  }

  get columns() {
    const result = [];
    for (var i = this.min; i <= this.max; i++) {
      result.push(this._columns[i] || []);
    }
    return result;
  }
}
