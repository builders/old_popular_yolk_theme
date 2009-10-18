<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="comments">
	<xsl:if test="entry">
		<h3>
			<xsl:choose>
				<xsl:when test="count(entry) = 1">
					<xsl:text>1 Comment</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="count(entry)"/> Comments
				</xsl:otherwise>
			</xsl:choose>

			<xsl:if test="$is-logged-in = 'true'">
				<xsl:text> &#8212; </xsl:text>
				<a href="{$root}/symphony/publish/comments/?filter=article:{/data/article/entry/@id}">Manage</a>
			</xsl:if>
		</h3>

		<ol id="comments" class="commentlist">
			<xsl:apply-templates select="entry"/>
		</ol>
	</xsl:if>
</xsl:template>

<xsl:template match="comments/entry">
	<li class="comment">
		<xsl:attribute name="id">
			<xsl:value-of select="concat('comment-', position())"/>
		</xsl:attribute>

		<div class="comment-body">
			<xsl:attribute name="id">
				<xsl:value-of select="concat('div-comment-', position())"/>
			</xsl:attribute>

			<div class="comment-author vcard">
				<xsl:call-template name="get-gravatar">
					<xsl:with-param name="email" select="email"/>
				</xsl:call-template>

				<cite class="fn">
					<xsl:choose>
						<xsl:when test="website">
							<a class="url" rel="external nofollow" href="{website}">
								<xsl:value-of select="author"/>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="author"/>
						</xsl:otherwise>
					</xsl:choose>
				</cite>
				<span class="says">says:</span>
			</div>

			<div class="comment-meta commentmetadata">
				<a href="{$root}/articles/{/data/article/entry/title/@handle}/#comment-{position()}">
					<xsl:call-template name="format-date">
						<xsl:with-param name="date" select="date"/>
						<xsl:with-param name="format" select="'M d, Y'"/>
					</xsl:call-template>
					<xsl:text> at </xsl:text>
					<xsl:call-template name="format-date">
						<xsl:with-param name="date" select="date"/>
						<xsl:with-param name="format" select="'T'"/>
					</xsl:call-template>
				</a>
			</div>

			<xsl:copy-of select="comment/*"/>
		</div>
	</li>
</xsl:template>

<xsl:template name="get-gravatar">
	<xsl:param name="email"/>

	<xsl:choose>
		<xsl:when test="/data/gravatars/gravatar/@email = $email">
			<img src="{/data/gravatars/gravatar[@email = $email]/@url}" width="32" height="32" class="avatar avatar-32 photo avatar-default"/>
		</xsl:when>
		<xsl:otherwise>
			<img src="{$root}/symphony/extensions/gravatar/assets/default.gif" widht="32" height="32" class="avatar avatar-32 photo avatar-default"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>