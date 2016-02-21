<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

<xsl:output method="xml" indent="yes" encoding="UTF-8"            
            doctype-public="-//W3C//DTD XHTML 1.1//EN"
            doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"/>

<xsl:template match="main" > 
  <xsl:apply-templates />
</xsl:template>
<xsl:template match="hoshin" > 
  <div class="hoshin">
  <h3><xsl:value-of select="./@title" /></h3>
  <xsl:apply-templates />
  </div>
</xsl:template>
<xsl:template match="article" > 
  <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
    <head>
      <title><xsl:value-of select="./title" /></title>
      <meta http-equiv="Content-Style-Type" content="text/css" />
      <link rel="stylesheet" href="eventtable.css" type="text/css" />
    </head>
    <body>
      <h1><xsl:value-of select="./title" /></h1>
      <h2><xsl:value-of select="./date" /></h2>
      <xsl:apply-templates select="./hoshin"/>
      <xsl:apply-templates select="./main"/>
    </body>
  </html>
</xsl:template>
<xsl:template match="events" > 
  <h3> <xsl:value-of select="./@title" /> </h3>
  <xsl:if test="attribute::aim">
    <h4> 目標:<xsl:value-of select="./@aim" /> </h4>
  </xsl:if>
  <!-- output table only when there is a child node "event" -->
  <xsl:if test="child::event">
    <table>
      <thead><tr>
        <th>時間</th>
        <th>タイムテーブル</th>
        <th>特記事項</th>
      </tr></thead>
      <tbody>
        <xsl:apply-templates />
      </tbody>
    </table>
  </xsl:if>
</xsl:template>
<xsl:template match="ul" >
  <ul><xsl:apply-templates /></ul>
</xsl:template>
<xsl:template match="ol" >
  <ol><xsl:apply-templates /></ol>
</xsl:template>
<xsl:template match="li" >
  <li><xsl:value-of select="." /></li>
</xsl:template>
<xsl:template match="event" > 
  <tr>
    <td><xsl:value-of select="./@time" /></td>
    <td><xsl:apply-templates select="./subject" /></td>
    <td><xsl:apply-templates select="./note"/></td>
  </tr>
</xsl:template>
</xsl:stylesheet>
