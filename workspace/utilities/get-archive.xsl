<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="archive">
	<xsl:apply-templates select="year"/>
	<xsl:apply-templates select="error"/>
</xsl:template>

<xsl:template match="error">
	<span>No documents found.</span>
</xsl:template>

<xsl:template match="year">
	<xsl:apply-templates select="month/entry"/>
</xsl:template>


<xsl:template match="month/entry">
	<ul class="list">
		<li class="date">
			<xsl:call-template name="format-date">
				<xsl:with-param name="date" select="date"/>
				<xsl:with-param name="format" select="'M d, Y'"/>
			</xsl:call-template>
		</li>
		<li class="title">
			<a href="{$root}/articles/{title/@handle}/">
				<xsl:value-of select="title"/>
			</a>
		</li>
		<li class="comments">
			<a href="{$root}/articles/{title/@handle}/#comments">
				Comments (<xsl:value-of select="@comments"/>)
			</a>
		</li>
	</ul>
</xsl:template>

</xsl:stylesheet>