<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/page-title.xsl"/>

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="/">
	<html>
		<head profile="http://gmpg.org/xfn/11">
			<title>
				<xsl:call-template name="page-title"/>
			</title>
			<link rel="stylesheet" type="text/css" media="screen" href="{$workspace}/css/styles.css" />
			<link rel="stylesheet" type="text/css" media="print" href="{$workspace}/css/print.css" />
			<link rel="alternate" type="application/rss+xml" href="{$root}/rss/" />
		</head>
		<body>
			<div id="container">
				<div id="masthead">
					<h1 id="site-name">
						<a href="{$root}"><xsl:value-of select="$website-name"/></a>
					</h1>
					<div class="clear"></div>
				</div>
				<div id="main">
					<div class="entry">
						<h2 class="entry-title">Maintenance</h2>
						<p><xsl:value-of select="$website-name"/> is currently in maintenance. Please check back later.</p>
					</div>
				</div>
				<p id="footer">
					Orchestrated by <a class="symphony" href="http://symphony-cms.com/">Symphony</a>
				</p>
			</div>
		</body>
	</html>
</xsl:template>

</xsl:stylesheet>