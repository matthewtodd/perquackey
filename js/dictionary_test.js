import assert from 'node:assert/strict';
import { describe, it } from 'node:test';
import Dictionary from './dictionary.js'

describe('Dictionary', () => {
  const dictionary = Dictionary.build([
    'act',
    'bat',
    'cab',
    'cat',
    'tab',
  ]);

  describe('lookup', () => {
    it('is empty with empty letters', () => {
      assert.deepEqual(Dictionary.lookup(dictionary, ''), [])
    })

    it('returns words that can be spelled with the given letters', () => {
      assert.deepEqual(Dictionary.lookup(dictionary, 'act'), ['act', 'cat'])
    })
  });
});
