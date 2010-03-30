// After finding YAWL, I pretty much lifted this algorithm straight from its
// anagram.c. It's certainly much faster than the Ruby code I wrote, since
// it's not making tons of throwaway strings. Fun stuff.
#include "ruby.h"

#define MAX_LENGTH 40
#define XOUT '@'
#define FALSE 0
#define TRUE 1

static VALUE mPerquackey;
static VALUE cDictionary;

int spell(char *word, char *letters) {
  static char letter_set[MAX_LENGTH];
  register char *letter;

  strcpy(letter_set, letters);
  strcat(letter_set, "\n");

  while (*word) {
    if ((letter = strchr(letter_set, *word++)) != NULL) {
      *letter = XOUT;
    } else {
      return FALSE;
    }
  }

  return TRUE;
}

// It's very tempting to move Dictionary#initialize into Ruby-land, but part
// of me thinks that it's cognitively easier to deal with if all of the
// Dictionary code to be in one file instead of 2. (And this constructor's not
// all that hard to read / write.)
VALUE Dictionary_initialize(VALUE self, VALUE filename) {
  rb_iv_set(self, "@filename", filename);
  return self;
}

// It's tempting to move Dictionary#words method into Ruby-land, just
// delegating to C for the time-critical work done by spell (i.e.
// File.readlines(@filename).select { |word| spell(word, letters) }), but
// there's a second, subtler benefit to keeping things here: that we don't
// have to build a Ruby string ('word') for each line in @filename -- fgets is
// wicked fast!
VALUE Dictionary_words(VALUE self, VALUE letters) {
  VALUE words = rb_ary_new();

  char word[MAX_LENGTH];

  FILE *file = fopen(RSTRING(rb_iv_get(self, "@filename"))->ptr, "rt");
  while (fgets(word, MAX_LENGTH, file) != NULL) {
    if (spell(word, RSTRING(letters)->ptr)) {
      rb_ary_push(words, rb_str_new(word, strlen(word) - 1)); // strlen(word) - 1 to strip the trailing newline
    }
  }
  fclose(file);

  return words;
}

void Init_dictionary() {
  mPerquackey = rb_define_module("Perquackey");
  cDictionary = rb_define_class_under(mPerquackey, "Dictionary", rb_cObject);
  rb_define_method(cDictionary, "initialize", Dictionary_initialize, 1);
  rb_define_method(cDictionary, "words",      Dictionary_words, 1);
}
