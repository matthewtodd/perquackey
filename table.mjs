export default class Table {
  constructor(words) {
    this.columns = {};
    this.height = 0;

    for (const word of words) {
      this.columns[word.length] ||= [];
      this.columns[word.length].push(word);
      this.height = Math.max(this.height, this.columns[word.length].length);
    }

    this.min = Math.min.apply(null, Object.keys(this.columns));
    this.max = Math.max.apply(null, Object.keys(this.columns));
  }

  get headers() {
    const result = [];
    for (var i = this.min; i <= this.max; i++) {
      result.push(String(i));
    }
    return result;
  }

  get rows() {
    const result = [];
    for (var i = 0; i < this.height; i++) {
      const row = [];
      for (var j = this.min; j <= this.max; j++) {
        const col = this.columns[j] || [];
        row.push(col[i] || '');
      }
      result.push(row);
    }
    return result;
  }
}
