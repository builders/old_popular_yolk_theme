<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="archive">
	<xsl:apply-templates select="year"/>
</xsl:template>

<xsl:template match="year">
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
		<thead>
			<tr>
				<th>Date</th>
				<th>Title</th>
				<th class="textcenter">Comments</th>
			</tr>
		</thead>
		<tbody>
			<xsl:apply-templates select="month/entry"/>
		</tbody>
	</table>
</xsl:template>

<xsl:template match="month/entry">
	<tr>
		<td>
			<xsl:call-template name="format-date">
				<xsl:with-param name="date" select="date"/>
				<xsl:with-param name="format" select="'x M y'"/>
			</xsl:call-template>
		</td>
		<td>
			<a href="{$root}/articles/{title/@handle}/">
				<xsl:value-of select="title"/>
			</a>
		</td>
		<td class="textcenter">
			<a href="{$root}/articles/{title/@handle}/#comments">
				<xsl:value-of select="@comments"/>
			</a>
		</td>
	</tr>
</xsl:template>

</xsl:stylesheet>