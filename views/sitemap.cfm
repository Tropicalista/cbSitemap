<cfoutput>

<ul>
	<li><a href="#cb.linkHome()#">Home</a>
		<ul>
			<cfloop array="#prc.pageResults.pages#" index="page">
				<cfif !page.hasParent()>
					<li><a href="#cb.linkPage(page.getSlug())#">#page.getTitle()#</a> - #page.getHTMLDescription()#
						<cfif page.hasChild()>
							<ul>
							<cfloop array="#page.getChildren()#" index="child">
								<li><a href="#cb.linkPage(child.getSlug())#">#child.getTitle()#</a> - #child.getHTMLDescription()#</li>
							</cfloop>
							</ul>
						</cfif>
					</li>
				</cfif>
			</cfloop>
			<li><a href="#cb.linkBlog()#">Blog</a>
				<ul>
					<cfloop array="#prc.entryResults.entries#" index="entry">
						<li><a href="#cb.linkPage(entry.getSlug())#">#entry.getTitle()#</a></li>
					</cfloop>
				</ul>
			</li>
		</ul>
	</li>
</ul>

</cfoutput>