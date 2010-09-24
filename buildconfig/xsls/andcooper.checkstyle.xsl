<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- All modificatiosn to original
     Checkstyle.xsl are Copyright (c) 2009, Fred Grott, ASFv2 License
     where applicable.
     
     

  
-->
<!DOCTYPE checkstyle [
  <!-- ====================================================================
       Mapping of images onto files
       ==================================================================== -->
  <!ENTITY logoImg            "images/checkstylelogo.png">
  <!ENTITY companylogoImg     "images/companylogo.png">
  <!ENTITY linkImg            "images/link.png">
 
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" 
     indent="yes"  />
<xsl:param name="project" select="files"/>
<xsl:param name="today" select="today"/>
<xsl:param name="context-root" select="context-root"/>
<xsl:param name="source-root" select="source-root"/>

<xsl:template match="/checkstyle">
    <html>
    <head>
    <META HTTP-EQUIV="Content-Style-Type" CONTENT="text/css"/>
    <title>Checkstyle Results for <xsl:value-of select="$project"/></title>
    <link rel="stylesheet" type="text/css" href="andcooper.reports.css"/>
    </head>
    <body>
    <h1><img src="&companylogoImg;"/></h1>
    <h1><img src="&logoImg;"/>Checkstyle Audit of <xsl:value-of select="$project"/> source code</h1>
    <p align="right">Run with <a href="http://checkstyle.sourceforge.net">Checkstyle <xsl:value-of select="//checkstyle/@version"/></a>  via <a href="http://ant.apache.org">Apache ANT <xsl:value-of select="//ant/@version"/></a> on <xsl:value-of select="$today"/></p>
    <hr size="2"/>
    <table class="summary">
        <tr>
            <th>Files</th>
            <th>Items Found</th>
        </tr>
        <tr>
            <td><xsl:value-of select="count(//file)"/></td>
            <td><xsl:value-of select="count(//error)" /></td>
        </tr>
    </table>
    <hr size="2" />
    <xsl:apply-templates/>
    <hr size="2"/>
    <h3>Explanations</h3>
    Checkstyle reports on coding style warnings with the following levels of error, warning, and info.
    </body>
    </html>
</xsl:template>

<xsl:template name="severityDiv">
<xsl:if test="@severity = 'error'">p1</xsl:if>
<xsl:if test="@severity = 'warning'">p2</xsl:if>
<xsl:if test="@severity = 'info'">p3</xsl:if>
</xsl:template>

<xsl:template match="//file[error]">
    <xsl:variable name="filename" select="@name"/>
    <xsl:variable name="translated-path" select="translate(@name, '\', '/')"/>
    <xsl:variable name="translated-source-root" select="translate($source-root, '\', '/')"/>
    <xsl:variable name="linkpath" select="substring-after($translated-path, $translated-source-root)"/>
    <xsl:variable name="class-name" select="translate($linkpath, '/', '.')"/>
    <table class="details">
    <tr>
    <th colspan="4">
        <xsl:value-of select="$linkpath"/></th>
    </tr>
    <xsl:for-each select="error">
        <tr>
        <td style="padding: 3px" align="right"><div><xsl:attribute name="class"><xsl:call-template name="severityDiv"/></xsl:attribute><xsl:value-of disable-output-escaping="yes" select="@severity"/></div></td>
        <xsl:variable name="lineNum" select="@line"/>
        <td><a href="{$context-root}/{$linkpath}.html#{$lineNum}">Line <xsl:value-of select="@line"/></a></td>
        <td><xsl:value-of select="."/></td>
        <td><xsl:value-of select="@message"/></td>
        </tr>
    </xsl:for-each>
    </table>
    <p/>
</xsl:template>

</xsl:stylesheet>
