import Fingerprint from './fingerprint.js'

export default class Dictionary {
  constructor(words) {
    // Indexing by fingerprint doesn't help much: in our word list, there are
    // 135,042 distinct words with 117,881 distinct fingerprints.
    this.words = {};

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
