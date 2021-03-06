<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/get-drafts.xsl"/>

<xsl:template match="data">
	<div class="entry">
		<xsl:choose>
			<xsl:when test="$entry = ''">
				<h3>Draft</h3>
				<h2>Secret lair</h2>
				<xsl:apply-templates select="drafts/entry" mode="list"/>
				<xsl:apply-templates select="drafts/error"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="drafts/entry"/>
			</xsl:otherwise>
		</xsl:choose>
	</div>
</xsl:template>

</xsl:stylesheet>