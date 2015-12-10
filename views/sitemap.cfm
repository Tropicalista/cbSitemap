<cfoutput>

<ul>
	<li><a href="#cb.linkHome()#">Home</a>
		<ul>
			<cfloop array="#prc.contentResults.content#" index="content">
				<cfif content.getContentType() Eq "page">
					<cfif !content.hasParent()>
						<li><a href="#cb.linkPage(content.getSlug())#">#content.getTitle()#</a> - #content.getHTMLDescription()#
							<cfif content.hasChild()>
								<ul>
								<cfloop array="#content.getChildren()#" index="child">
									<li><a href="#cb.linkPage(child.getSlug())#">#child.getTitle()#</a> - #child.getHTMLDescription()#</li>
								</cfloop>
								</ul>
							</cfif>
						</li>
					</cfif>
				</cfif>
			</cfloop>
			<li><a href="#cb.linkBlog()#">#prc.cbSettings.cb_site_blog_entrypoint#</a></li>
		</ul>
	</li>
</ul>

</cfoutput>