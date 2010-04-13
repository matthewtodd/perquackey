#include "ruby.h"

static VALUE mPerquackey;
static VALUE mStringExtensions;

VALUE StringExtensions_spell_p(VALUE self, VALUE other) {
  VALUE scratch_pad_value;
  register char *scratch_pad;
  register char *scratch_pad_ptr;
  register char *other_ptr;

  scratch_pad_value = rb_str_dup(self);
  rb_str_modify(scratch_pad_value);
  scratch_pad = RSTRING(scratch_pad_value)->ptr;
  other_ptr = RSTRING(other)->ptr;

  while (*other_ptr) {
    if ((scratch_pad_ptr = strchr(scratch_pad, *other_ptr++)) != NULL) {
      *scratch_pad_ptr = '@';
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
