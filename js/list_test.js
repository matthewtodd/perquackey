import assert from 'node:assert/strict';
import { describe, it } from 'node:test';
import List from './list.js';

describe('List', () => {
  it('has no headers when empty', () => {
    const list = new List([]);
    assert.deepEqual(list.headers, []);
  })

  it('has no columns when empty', () => {
    const list = new List([]);
    assert.deepEqual(list.columns, []);
  })

  it('has headers from shortest to longest word length', () => {
    const list = new List(['cat', 'jaguar']);
    assert.deepEqual(list.headers, ['3', '4', '5', '6']);
  });

  it('has columns with gaps filled in', () => {
    const list = new List(['cat', 'jaguar']);
    assert.deepEqual(list.columns, [['cat'], [], [], ['jaguar']]);
  });
});
