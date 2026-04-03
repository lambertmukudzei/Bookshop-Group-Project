<?xml version="1.0" encoding="UTF-8"?>

<!-- 
    CST1340 Coursework
    XSL Transformation File 
    Purpose: Transforms book catalogue XML into XHTML display format
    XSL Commands Used: xsl:template, xsl:for-each, xsl:value-of, xsl:attribute, xsl:text
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- 
    Root template: matches the entire XML document (/)
    Generates HTML output structure
-->

<xsl:template match="/">
  <html>
    <head>
      <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Georgia, 'Times New Roman', serif;
            background-color: #fdf6e3;
            color: #3c3226;
            line-height: 1.7;
            padding: 20px;
        }

        header {
            background-color: #4a2c0a;
            color: #fdf6e3;
            padding: 20px 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        header h1 {
            font-size: 2.2em;
            letter-spacing: 2px;
        }

        header p {
            font-style: italic;
            font-size: 0.95em;
            color: #f0d9b5;
        }

        nav {
            background-color: #7a4419;
            padding: 12px 40px;
            display: flex;
            gap: 30px;
        }

        nav a {
            color: #fdf6e3;
            text-decoration: none;
            font-size: 1em;
            font-family: Arial, sans-serif;
            padding: 5px 10px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        nav a:hover {
            background-color: #4a2c0a;
        }

        nav a.active {
            background-color: #4a2c0a;
            font-weight: bold;
        }

        .hero {
            background-color: #c9956a;
            text-align: center;
            padding: 50px 40px;
            border-bottom: 4px solid #4a2c0a;
            margin-bottom: 30px;
        }

        .hero h2 {
            font-size: 2em;
            color: #fdf6e3;
            margin-bottom: 10px;
        }

        .hero p {
            color: #fdf6e3;
            font-size: 1.1em;
        }

        main {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        h2 {
            color: #4a2c0a;
            font-size: 2em;
            margin-bottom: 20px;
            text-align: center;
        }

        .home-link {
            display: inline-block;
            margin: 20px 0;
        }

        .home-link a {
            background-color: #7a4419;
            color: #fdf6e3;
            text-decoration: none;
            padding: 8px 16px;
            border-radius: 4px;
            font-family: Arial, sans-serif;
            transition: background-color 0.3s;
        }

        .home-link a:hover {
            background-color: #4a2c0a;
        }

        .intro-text {
            font-size: 1.05em;
            background-color: #fff9ef;
            padding: 20px;
            border-left: 5px solid #c9956a;
            border-radius: 4px;
            margin-bottom: 30px;
        }

        h3 {
            font-size: 1.6em;
            color: #4a2c0a;
            border-bottom: 2px solid #c9956a;
            padding-bottom: 8px;
            margin-top: 30px;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff9ef;
            border-radius: 6px;
            overflow: hidden;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }

        /* Remove old border and use CSS instead */
        table[border="1"] {
            border: none;
        }

        th {
            background-color: #4a2c0a;
            color: #fdf6e3;
            padding: 12px 20px;
            text-align: left;
            font-family: Arial, sans-serif;
            font-size: 0.95em;
            letter-spacing: 1px;
        }

        /* Override the inline bgcolor */
        tr[bgcolor="#e112b4"] {
            background-color: #4a2c0a !important;
        }

        td {
            padding: 10px 20px;
            font-family: Arial, sans-serif;
            font-size: 0.95em;
            border-bottom: 1px solid #e8d5b5;
        }

        tr:nth-child(even) {
            background-color: #fdf0dc;
        }

        tr:hover {
            background-color: #f5e6d3;
            transition: background-color 0.3s;
        }

        img {
            border-radius: 4px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .footer-link {
            display: inline-block;
            margin-top: 20px;
        }

        .footer-link a {
            background-color: #7a4419;
            color: #fdf6e3;
            text-decoration: none;
            padding: 8px 16px;
            border-radius: 4px;
            font-family: Arial, sans-serif;
            transition: background-color 0.3s;
        }

        .footer-link a:hover {
            background-color: #4a2c0a;
        }

        footer {
            background-color: #4a2c0a;
            color: #f0d9b5;
            text-align: center;
            padding: 20px;
            font-family: Arial, sans-serif;
            font-size: 0.9em;
            margin-top: 60px;
        }

        footer a {
            color: #c9956a;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }

        .price-cell {
            color: #27ae60;
            font-weight: bold;
        }
      </style>
    </head>
    <body>

      <header>
        <h1>Page Turner</h1>
        <p>Your gateway to endless stories</p>
      </header>

      <nav>
        <a href="index.html" class="active">Home</a>
        <a href="#">Books</a>
        <a href="#">Categories</a>
        <a href="#">Contact</a>
      </nav>

      <div class="hero">
        <h2>Discover Your Next Great Read</h2>
        <p>Page Turners that will have you reading for days</p>
      </div>

      <main>
        <div class="home-link">
          <a href="index.html">Back to Home</a>
        </div>

        <div class="intro-text">
          <p>Here is a list of our Page Turners that will have you turning pages for days. Feel free to browse and purchase any Page Turners that capture your attention!</p>
        </div>

        <!-- 
          xsl:for-each – Iterates through each category element
          Selects all category elements within the library root
        -->
        <xsl:for-each select="library/category">
          <h3><xsl:value-of select="@name"/></h3> <!-- Outputs category name as a heading using @name attribute -->
          <table border="1">
            <tr>
              <th>Cover</th>
              <th>Title</th>
              <th>Author</th>
              <th>ISBN</th>
              <th>Publisher</th>
              <th>Edition</th>
              <th>Year</th>
              <th>Price</th>
            </tr>
            <!-- 
              Nested xsl:for-each – Iterates through each book in current category
              Processes all book elements
            -->
            <xsl:for-each select="book">
              <tr>
                <td>
                  <img>  <!-- Cover image column: uses xsl:attribute to set src and width -->
                    <xsl:attribute name="src">
                      <xsl:value-of select="image"/>
                    </xsl:attribute>
                    <xsl:attribute name="width">100</xsl:attribute>
                  </img>
                </td>
                <td><xsl:value-of select="Title"/></td> <!-- Book title -->
                <!-- 
                  Author column: concatenates first name and last name
                  xsl:text adds a space between names
                -->
                <td>
                  <xsl:value-of select="Author/firstName"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="Author/lastName"/>
                </td>
                <td><xsl:value-of select="ISBN"/></td> <!-- ISBN number -->
                <td><xsl:value-of select="Publisher"/></td> <!-- Publisher name -->
                <td><xsl:value-of select="edition"/></td> <!-- Edition information -->
                <td><xsl:value-of select="date"/></td> <!-- Publication year -->
                <td class="price-cell">$<xsl:value-of select="price"/></td> <!-- Price with currency symbol -->
              </tr>
            </xsl:for-each>
          </table>
          <br/>
        </xsl:for-each>
        
        <div class="footer-link">
          <a href="index.html">Back to Home</a>
        </div>
      </main>

      <footer>
        <p>&copy; 2024 Page Turner Bookstore. All rights reserved.</p>
        <p><a href="#">Privacy Policy</a> | <a href="#">Terms of Use</a> | <a href="#">Contact Us</a></p>
      </footer>

      <br/><br/>
    </body>
  </html>
</xsl:template>

</xsl:stylesheet>