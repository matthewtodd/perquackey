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

VALUE Dictionary_initialize(VALUE self, VALUE filename) {
  rb_iv_set(self, "@filename", filename);
  return self;
}

VALUE Dictionary_words(VALUE self, VALUE letters) {
  VALUE words = rb_ary_new();

  char word[MAX_LENGTH];

  FILE *file = fopen(RSTRING(rb_iv_get(self, "@filename"))->ptr, "rt");
  while (fgets(word, MAX_LENGTH, file) != NULL) {
    if (spell(word, RSTRING(letters)->ptr)) {
      rb_ary_push(words, rb_str_new(word, strlen(word) - 1));
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