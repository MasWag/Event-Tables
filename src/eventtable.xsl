<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" > 
<xsl:template match="/" > 
  <xsl:apply-templates />
</xsl:template>
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
  <html>
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
  <h3><xsl:value-of select="./@title" /></h3>
  目標:<xsl:value-of select="./@aim" />
  <table>
  <thead><tr>
    <th>時間</th>
    <th>タイムテーブル</th>
    <th>特記事項</th>
  </tr></thead>
  <xsl:apply-templates />
  </table>
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
 <tbody>
  <tr>
    <td><xsl:value-of select="./@time" /></td>
    <td><xsl:apply-templates select="./subject" /></td>
    <td><xsl:apply-templates select="./note"/></td>
  </tr>
 </tbody>
</xsl:template>
</xsl:stylesheet>
