<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="typography.xsl"/>
<xsl:import href="get-images.xsl"/>

<xsl:template match="homepage-articles/entry">
	<div class="entry">
		<h2 class="entry-title">
			<a href="{$root}/articles/{title/@handle}/"><xsl:value-of select="title"/></a>
		</h2>

		<p class="meta">
			<xsl:call-template name="format-date">
				<xsl:with-param name="date" select="date"/>
				<xsl:with-param name="format" select="'M d, Y'"/>
			</xsl:call-template>
			<xsl:if test="$is-logged-in = 'true'">
				<xsl:text> &#8212; </xsl:text>
				<a class="edit" href="{$root}/symphony/publish/{../section/@handle}/edit/{@id}/">Edit</a>
			</xsl:if>
		</p>

		<div class="entry-content">
			<xsl:apply-templates select="body/*[position() &lt;= 2]" mode="html"/>
			<xsl:call-template name="get-images">
				<xsl:with-param name="entry-id" select="@id"/>
			</xsl:call-template>
			<xsl:apply-templates select="body/*[position() &gt; 2 and position() &lt;= 4]" mode="html"/>
		</div>

		<p class="meta">
			<a href="{$root}/articles/{title/@handle}/#comments">
				<xsl:choose>
					<xsl:when test="@comments = 0">
						<xsl:text>No Comment</xsl:text>
					</xsl:when>
					<xsl:when test="@comments = 1">
						<xsl:text>1 Comment</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="@comments"/> Comments
					</xsl:otherwise>
				</xsl:choose>
			</a>
		</p>
	</div>
</xsl:template>

<xsl:template match="homepage-articles/error">
	<div class="entry">
		<h4>No articles found. Please back later.</h4>
	</div>
</xsl:template>


<xsl:template match="article/entry">
	<div class="entry">
		<h2 class="entry-title">
			<xsl:value-of select="title"/>
		</h2>

		<p class="meta">
			Published on
			<xsl:call-template name="format-date">
				<xsl:with-param name="date" select="date"/>
				<xsl:with-param name="format" select="'M d, Y'"/>
			</xsl:call-template>
			<xsl:if test="$is-logged-in = 'true'">
				<xsl:text> &#8212; </xsl:text>
				<a class="edit" href="{$root}/symphony/publish/{../section/@handle}/edit/{@id}/">Edit</a>
			</xsl:if>
		</p>

		<div class="entry-content">
			<xsl:apply-templates select="body/*[position() &lt;= 2]" mode="html"/>
			<xsl:call-template name="get-images">
				<xsl:with-param name="entry-id" select="@id"/>
			</xsl:call-template>
			<xsl:apply-templates select="body/*[position() &gt; 2 and position() &lt;= 4]" mode="html"/>
		</div>

		<p class="meta">
			Filed under: <xsl:apply-templates select="categories/item"/>
		</p>
	</div>
</xsl:template>

<xsl:template match="categories/item">
	<a href="{$root}/home/{@handle}"><xsl:value-of select="."/></a>
	<xsl:if test="position() != last()">
		<xsl:text>, </xsl:text>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>