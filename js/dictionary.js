import Fingerprint from './fingerprint.js'

export default class Dictionary {
  static build(words) {
    // Indexing by fingerprint doesn't help much: in our word list, there are
    // 135,042 distinct words with 117,881 distinct fingerprints.
    const dictionary = {};

    words.forEach((word) => {
      dictionary[word] = Fingerprint.build(word);
    });

    return dictionary;
  }

  static lookup(dictionary, letters) {
    const mask = Fingerprint.build(letters);

    // TODO explore generator functions?
    return Object.entries(dictionary)
      .filter(([_, fingerprint]) => Fingerprint.includes(mask, fingerprint))
      .map(([word, _]) => word);
  }
}
