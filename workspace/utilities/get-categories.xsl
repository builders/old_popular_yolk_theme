<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="categories">
	<h2>Categories</h2>
	<ul>
		<xsl:apply-templates select="title"/>
	</ul>
</xsl:template>

<xsl:template match="categories/title">
	<li class="cat-item">
		<a href="{concat($root, '/home/', @handle)}">
			<xsl:value-of select="@value"/>
		</a>
	</li>
</xsl:template>

</xsl:stylesheet>