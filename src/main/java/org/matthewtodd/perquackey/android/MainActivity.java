package org.matthewtodd.perquackey.android;

import android.app.ListActivity;
import android.os.Bundle;
import android.view.ViewGroup;
import android.widget.SimpleAdapter;

import org.matthewtodd.perquackey.common.Words;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

public class MainActivity extends ListActivity {
    @Override protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.root_layout);

        List<Map<String, String>> data = new ArrayList<>();
        for (String word : new Words()) {
            data.add(Collections.singletonMap("word", word));
        }

        setListAdapter(new SimpleAdapter(this, data, R.layout.word_layout, new String[]{"word"}, new int[]{R.id.word}));
    }
}
