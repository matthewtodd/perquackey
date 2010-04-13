#include "ruby.h"

#define MAX_LENGTH 40
#define XOUT '@'

static VALUE mPerquackey;
static VALUE mStringExtensions;

VALUE StringExtensions_spell_p(VALUE self, VALUE other) {
  char letter_set[MAX_LENGTH];
  register char *letter;

  char *word;
  char *letters;

  letters = RSTRING(self)->ptr;
  word = RSTRING(other)->ptr;

  strcpy(letter_set, letters);

  while (*word) {
    if ((letter = strchr(letter_set, *word++)) != NULL) {
      *letter = XOUT;
    } else {
      return Qfalse;
    }
  }

  return Qtrue;
}

void Init_string_extensions() {
  mPerquackey = rb_define_module("Perquackey");
  mStringExtensions = rb_define_module_under(mPerquackey, "StringExtensions");
  rb_define_method(mStringExtensions, "spell?", StringExtensions_spell_p, 1);
}
