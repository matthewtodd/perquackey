#include "ruby.h"
#include "rubyio.h"

#define MAX_LENGTH 40
#define XOUT '@'
#define FALSE 0
#define TRUE 1

static VALUE mPerquackey;
static VALUE mAnagrams;

static void chop(char *string) {
  int length = strlen(string);

  if (length > 0 && string[length-1] == '\n') {
    string[length-1] = '\0';
  }
}

static int anagram_p(char *letters, char *word) {
  static char scratch_pad[MAX_LENGTH];
  register char *scratch_pad_ptr;

  strcpy(scratch_pad, letters);

  while (*word) {
    if ((scratch_pad_ptr = strchr(scratch_pad, *word++)) != NULL) {
      *scratch_pad_ptr = XOUT;
    } else {
      return FALSE;
    }
  }

  return TRUE;
}

/*
 * Document-class: Anagrams
 * Document-method: each_anagram
 *
 * call-seq:
 *   each_anagram(letters) { |anagram| ... } -> nil
 *
 */
static VALUE Anagrams_each_anagram(VALUE self, VALUE letters_value) {
  rb_io_t *stream;
  char     word[MAX_LENGTH];
  char    *letters = RSTRING(letters_value)->ptr;

  GetOpenFile(self, stream);

  while (fgets(word, sizeof(word), stream->f) != NULL) {
    chop(word);

    if (anagram_p(letters, word)) {
      rb_yield(rb_str_new2(word));
    }
  }

  return Qnil;
}

/*
 * Anagrams extends a File-backed IO stream with the ability to yield each
 * anagram of the given letters it contains:
 *
 *  File.open('/usr/share/dict/words') do |stream|
 *    stream.extend(Anagrams)
 *    stream.each_anagram('asdfuiop') do |anagram|
 *      puts anagram
 *    end
 *  end
 *
 */
void Init_anagrams() {
  mPerquackey = rb_define_module("Perquackey");
  mAnagrams = rb_define_module_under(mPerquackey, "Anagrams");
  rb_define_method(mAnagrams, "each_anagram", Anagrams_each_anagram, 1);
}
