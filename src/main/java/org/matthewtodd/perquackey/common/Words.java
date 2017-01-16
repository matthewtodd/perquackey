package org.matthewtodd.perquackey.common;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class Words implements Iterable<String> {
  private final Set<String> words;

  public Words() {
    words = new HashSet<>();
    words.add("vair");
    words.add("kerfuffle");
  }

  @Override public Iterator<String> iterator() {
    return words.iterator();
  }
}
