Event-Tables
============

いわゆるタイムテーブル (時間割や時刻表ではない) を記述したxmlからxhtmlを生成するxsltです。xhtml 1.1を出力するはずです。invalidであればバグです。xsltで日本語を出力するのでとりあえず多言語対応はするつもりはありません。


あるもの
========

src/makexml.awk
---------------

markdown風のタイムテーブルを所定のXMLに変換するツール。AWKで書かれている。

```
awk ./src/makexml.awk < ./example/sample-input.md > output.xml
```

とかいう感じで使う。

src/eventtable.xsl
------------------

XMLで書かれたタイムテーブルをxhtmlに変換するxsltのテンプレート。出力されたxhtmlはsrc/eventtable.cssを使って表示すると良さげ。

```
xsltproc ./src/eventtable.xsl ./example/sample-input.xml > output.html
```

とかいう感じで使う。

TODO
====

* どういうXMLを受け取るかを (多分自然言語で)書く
* markdownっぽいものをnoteに箇条書きを書けるように変える

This software is released under the MIT License, see LICENSE. 
