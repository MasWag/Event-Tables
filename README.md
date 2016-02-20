Event-Tables
============

いわゆるタイムテーブル (時間割や時刻表ではない) を記述したxmlからhtmlを生成するxsltです。現状出力するファイルはxhtmlではないです。xsltで日本語を出力するのでとりあえず多言語対応はするつもりはありません。


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

XMLで書かれたタイムテーブルをhtmlに変換するxsltのテンプレート。出力されたhtmlはsrc/eventtable.cssを使って表示すると良さげ。

```
xsltproc ./src/eventtable.xsl ./example/sample-input.xml > output.html
```

とかいう感じで使う。
