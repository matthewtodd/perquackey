class Perquackey::Dictionary
  YAWL = File.join(File.dirname(__FILE__), '..', '..', 'resources', 'yawl-0.3.2-word.list')
  
  def words(letters)
    c_words(letters, YAWL)
  end
  
  # After finding YAWL, I pretty much lifted this algorithm straight from its
  # anagram.c. It's certainly much faster than the Ruby code I wrote, since
  # it's not making tons of throwaway strings. Fun stuff.
  inline do |builder|
    builder.prefix <<-END
      #define MAX_LENGTH 40
      #define XOUT '@'
      #define FALSE 0
      #define TRUE 1
    END
    
    builder.c_raw <<-END
      int c_spell(char *word, char *letters) {
        static char letter_set[MAX_LENGTH];
        register char *letter;
        
        strcpy(letter_set, letters);
        strcat(letter_set, "\\n");
        
        while (*word) {
          if ((letter = strchr(letter_set, *word++)) != NULL) {
            *letter = XOUT;
          } else {
            return FALSE;
          }
        }
        
        return TRUE;
      }
    END
    
    builder.c <<-END
      VALUE c_words(VALUE letters, VALUE filename) {
        VALUE words = rb_ary_new();

        char word[MAX_LENGTH];
        
        FILE *file = fopen(RSTRING(filename)->ptr, "rt");
        while (fgets(word, MAX_LENGTH, file) != NULL) {
          if (c_spell(word, RSTRING(letters)->ptr)) {
            rb_ary_push(words, rb_str_new(word, strlen(word) - 1));
          }
        }
        fclose(file);
        
        return words;
      }
    END
  end
end