<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="get-images">
	<xsl:param name="entry-id"/>
	<xsl:if test="/data/article-images/entry[article/item/@id = $entry-id]">
		<div class="caption alignnone" style="width:580px">
			<xsl:apply-templates select="/data/article-images/entry[article/item/@id = $entry-id]"/>
		</div>
	</xsl:if>
</xsl:template>

<xsl:template match="article-images/entry">
	<a href="{$workspace}/uploads/{image/filename}">
		<img title="{description}" alt="{description}">
			<xsl:attribute name="src">
				<xsl:value-of select="$root"/>
				<xsl:choose>
					<xsl:when test="image/meta/@width &gt; 580">
						<xsl:text>/image/1/580/0/uploads/</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>/workspace/upload/</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:value-of select="image/filename"/>
			</xsl:attribute>
		</img>
	</a>
	<p class="caption-text"><xsl:value-of select="description"/></p>
</xsl:template>

</xsl:stylesheet>