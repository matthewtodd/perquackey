#include "ruby.h"

static VALUE mPerquackey;
static VALUE mStringExtensions;

// This scratch pad algorithm was lifted from YAWL's anagram.c, and then the
// particulars were modified to take advantage of Ruby's String copying
// functions.
//
// I tried writing this in Ruby, but it was noticeably slower:
//
// def spell?(other)
//   scratch_pad = dup
//
//   other.each_char do |letter|
//     if found = scratch_pad.index(letter)
//       scratch_pad[found] = '@'
//     else
//       return false
//     end
//   end
//
//   true
// end
//
// Someday, I would like to experiment with pulling more of the Dictionary code
// back into C. It would be lovely to be able to write something like this:
//
// def words(letters)
//   words = []
//
//   @word_list.open do |stream|
//     stream.extend(Anagrams)
//     stream.each_anagram(letters) do |word|
//       words << word
//     end
//   end
//
//   words
// end
//
// Or perhaps each_anagram could even handle opening the stream for me.
// Alternatively, maybe this spelling will be fast enough if I can move the
// memory used by scratch_pad into an instance variable?
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
