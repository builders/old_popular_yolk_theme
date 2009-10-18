<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/get-article.xsl"/>
<xsl:import href="../utilities/get-comments.xsl"/>

<xsl:template match="data">
	<xsl:apply-templates select="article/entry"/>
	<xsl:apply-templates select="comments"/>
	
	<div id="respond">
		<h3>Leave a Reply</h3>
		<form id="commentform" action="{concat($root, '/articles/', article/entry/title/@handle, '/#commentform')}" method="post">
			<xsl:for-each select="events/save-comment">
				<p class="{@result}">
					<xsl:choose>
						<xsl:when test="@result = 'success'">Your comment has been saved successfully.</xsl:when>
						<xsl:otherwise>The system encountered errors when saving your comment. Please check if all the required fields have been filled.</xsl:otherwise>
					</xsl:choose>
				</p>
			</xsl:for-each>

			<p>
				<input id="author" type="text" size="22" name="fields[author]" value="{events/save-comment/post-values/author}"/>
				<label for="author">
					<small>Name (required)</small>
				</label>
			</p>
			<p>
				<input id="email" type="text" size="22" name="fields[email]" value="{events/save-comment/post-values/email}"/>
				<label for="email">
					<small>Mail (will not be published) (required)</small>
				</label>
			</p>
			<p>
				<input id="website" type="text" size="22" name="fields[website]" value="{events/save-comment/post-values/website}"/>
				<label for="website">
					<small>Website</small>
				</label>
			</p>
			<p>
				<textarea rows="10" cols="100%" id="comment" name="fields[comment]">
					<xsl:value-of select="events/save-comment/post-values/comment"/>
				</textarea>
			</p>
			<p>
				<input name="fields[article]" value="{article/entry/@id}" type="hidden" />
				<input type="submit" id="submit" value="Submit Comment" name="action[save-comment]"/>
			</p>
		</form>
	</div>
</xsl:template>

</xsl:stylesheet>