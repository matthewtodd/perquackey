import assert from 'node:assert/strict';
import { describe, it } from 'node:test';
import Dictionary from './dictionary.js'

describe('Dictionary', () => {
  const dictionary = new Dictionary([
    'act',
    'bat',
    'cab',
    'cat',
    'tab',
  ]);

  describe('lookup', () => {
    it('is empty with empty letters', () => {
      assert.deepEqual(dictionary.lookup(''), [])
    })

    it('returns words that can be spelled with the given letters', () => {
      assert.deepEqual(dictionary.lookup('act'), ['act', 'cat'])
    })
  });
});
