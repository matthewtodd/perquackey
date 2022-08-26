import assert from 'node:assert/strict';
import { describe, it } from 'node:test';
import Fingerprint from './fingerprint.mjs'

describe('Fingerprint', () => {
  const positiveExamples = [
    ['', ''],
    ['act', 'cat'],
    ['Act', 'CAT'],
    ['ceeeehhsss', 'cheese'],
  ];

  for (const example of positiveExamples) {
    it(`${example[0]} includes ${example[1]}`, () => {
      assert(new Fingerprint(example[0]).includes(new Fingerprint(example[1])));
    });
  }

  const negativeExamples = [
    ['act', 'cab'],
    ['act', 'tact'],
    ['cehs', 'cheese'],
  ];

  for (const example of negativeExamples) {
    it(`${example[0]} does not include ${example[1]}`, () => {
      assert(!new Fingerprint(example[0]).includes(new Fingerprint(example[1])));
    });
  }
});
