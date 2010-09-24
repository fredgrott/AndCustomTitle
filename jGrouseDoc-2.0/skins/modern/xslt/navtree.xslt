<!-- 
	jGrouseDoc template file. Creates Index page.
	Based on contribution from broofa (http://broofa.com)
	@Copyright (c) 2007 by Denis Riabtchik. All rights reserved. See license.txt and http://jgrouse.com for details@
	$Id: navtree.xslt 249 2007-11-12 00:51:31Z denis.riabtchik $
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
    <xsl:param name='rootPath' />
    <xsl:param name="projectDesc"/>
    <xsl:param name='version'/>
    <xsl:param name='aux_css'>not_specified</xsl:param>
    
    <xsl:output method='HTML' doctype-public="-//W3C//DTD HTML 4.01//EN"
        doctype-system="http://www.w3.org/TR/html4/strict.dtd">

    </xsl:output>
    <xsl:import href="../../common/xslt/common.xslt"/>
    
    <xsl:template match="/">
        <xsl:comment>Generated by jGrouseDoc</xsl:comment>
    
        <html>
            <head>
                <xsl:call-template name="writeCss">
                    <xsl:with-param name="rootPath"><xsl:value-of select="$rootPath"/></xsl:with-param>
                    <xsl:with-param name="aux_css"><xsl:value-of select="$aux_css"/></xsl:with-param>
                </xsl:call-template>
            <script type="text/javascript" src="navTree.js">
            </script>
            </head>
            <body>
                <div class="navTree">
				<div class="navbar">
				    Browse by 
				    <a href="allclasses-frame.html">name</a> &#183;
				    <span class="currentPage">path</span> &#183; 
				    <a href="allFiles.html">file</a>
				</div>
				<div>
				    <a class="openAll" href="javascript:jgdoc.Searcher.onOpenAll()">Open All</a>
				    <a class="closeAll" href="javascript:jgdoc.Searcher.onCloseAll()">Close All</a>
				</div>
				
				<div>
				    <ul id = "content" class="contents">
				        Loading...
				    </ul>
				</div>
				</div>
			</body>
            <script type="text/javascript" src="jsindex.js">
            </script>
        </html>
    </xsl:template>
</xsl:stylesheet>
