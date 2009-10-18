<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template match="data">
	<div class="entry">
		<h2 class="entry-title">Biography</h2>
		<div class="entry-content">
			<h3>
				<xsl:value-of select="website-owner/author/name"/>
				<xsl:text> is a professional space monkey extraordinaire</xsl:text>
			</h3>
			<p>
				<em><xsl:value-of select="$website-name"/></em> is running off a freshly installed copy of <a href="http://symphony-cms.com">Symphony CMS</a>.
			</p>
			<p>Be sure to check back regularly as the site transforms from <em>fresh prince</em> to <em>whizz-bang candy steak</em>.</p>

			<h4>Notes</h4>
			<ul>
				<li>It's preferred to use the contact form rather than email. There is always a chance for emails to be picked up as spam.</li>
				<li>I will generally reply to messages within 24 hours unless I am horribly swamped.</li>
			</ul>
		</div>

		<div id="respond">
			<h3>Contact Me</h3>

			<form action="{$root}/about/#contact" method="POST" id="contact">
				<xsl:for-each select="events/save-message">
					<p class="{@result}">
						<xsl:choose>
							<xsl:when test="@result = 'success'">Email sent.</xsl:when>
							<xsl:otherwise>The system encountered errors while sending your email. Please check if all the required fields have been filled.</xsl:otherwise>
						</xsl:choose>
					</p>
				</xsl:for-each>
				
				<p>
					<input id="name" type="text" size="22" name="fields[name]" value="{events/save-message/post-values/name}"/>
					<label for="name">
						<small>Name (required)</small>
					</label>
				</p>
				<p>
					<input id="email" type="text" size="22" name="fields[email]" value="{events/save-message/post-values/email}"/>
					<label for="email">
						<small>Email (required)</small>
					</label>
				</p>
				<p>
					<xsl:choose>
						<xsl:when test="events/save-message/post-values/subject">
							<input id="subject" type="text" size="22" name="fields[subject]" value="{events/save-message/post-values/subject}" />
						</xsl:when>
						<xsl:otherwise>
							<input id="subject" type="text" size="22" name="fields[subject]" value="General Enquiry" />
						</xsl:otherwise>
					</xsl:choose>

					<label for="subject">
						<small>Subject</small>
					</label>
				</p>
				<p>
					<textarea rows="10" cols="100%" id="comment" name="fields[message]">
						<xsl:value-of select="events/save-message/post-values/message" />
					</textarea>
				</p>
				<p>
					<input name="send-email[recipient]" value="{website-owner/author/username}" type="hidden" />
					<input name="send-email[sender-email]" value="fields[email]" type="hidden" />
					<input name="send-email[sender-name]" value="fields[name]" type="hidden" />
					<input name="send-email[subject]" value="fields[subject]" type="hidden" />
					<input name="send-email[body]" value="fields[message],fields[subject],fields[email],fields[name]" type="hidden" />

					<input id="submit" type="submit" name="action[save-message]" value="Send" />
				</p>
			</form>
		</div>
	</div>
</xsl:template>

</xsl:stylesheet>