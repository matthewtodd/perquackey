import Fingerprint from './fingerprint.mjs'

export default class Dictionary {
  constructor(words) {
    this.words = {};

    // TODO consider first indexing by fingerprint?
    words.forEach((word) => {
      this.words[word] = new Fingerprint(word);
    });
  }

  lookup(letters) {
    const mask = new Fingerprint(letters);

    // TODO explore generator functions?
    return Object.entries(this.words)
      .filter(([_, fingerprint]) => mask.includes(fingerprint))
      .map(([word, _]) => word);
  }
}
