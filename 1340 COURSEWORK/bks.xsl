<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
    <body>
      <h2>Page Turner</h2>
        <a href="index.html">Back to Home</a>
        <br/><br/>

        <p>Here is a list of our Page Turners that will have you turning pages for days. Feel free to browse and purchase any Page Turners that capture your attention!</p> 
      
      <xsl:for-each select="library/category">
        <h3><xsl:value-of select="@name"/></h3>
        <table border="1">
          <tr bgcolor="#e112b4">
            <th>Cover</th>
            <th>Title</th>
            <th>Author</th>
            <th>ISBN</th>
            <th>Publisher</th>
            <th>Edition</th>
            <th>Year</th>
            <th>Price</th>
           </tr>
          <xsl:for-each select="book">
            <tr>
              <td>
                <img>
                  <xsl:attribute name="src">
                    <xsl:value-of select="image"/>
                  </xsl:attribute>
                  <xsl:attribute name="width">100</xsl:attribute>
                </img>
              </td>
              <td><xsl:value-of select="Title"/></td>
              <td>
                <xsl:value-of select="Author/firstName"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="Author/lastName"/>
              </td>
              <td><xsl:value-of select="ISBN"/></td>
              <td><xsl:value-of select="Publisher"/></td>
              <td><xsl:value-of select="edition"/></td>
              <td><xsl:value-of select="date"/></td>
              <td>$<xsl:value-of select="price"/></td>
            </tr>
          </xsl:for-each>
        </table>
        <br/>
      </xsl:for-each>
       <a href="index.html">Back to Home</a>
      <br/><br/>
    </body>
  </html>
</xsl:template>

</xsl:stylesheet>



