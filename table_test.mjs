import assert from 'node:assert/strict';
import { describe, it } from 'node:test';
import Table from './table.mjs';

describe('Table', () => {
  it('has no headers when empty', () => {
    const table = new Table([]);
    assert.deepEqual(table.headers, []);
  });

  it('has no rows when empty', () => {
    const table = new Table([]);
    assert.deepEqual(table.rows, []);
  });

  it('has headers from shortest to longest word length', () => {
    const table = new Table(['cat', 'jaguar']);
    assert.deepEqual(table.headers, ['3', '4', '5', '6']);
  });

  it('has rows with gaps filled in', () => {
    const table = new Table(['cat', 'jaguar']);
    assert.deepEqual(table.rows, [['cat', '', '', 'jaguar']]);
  });
});
