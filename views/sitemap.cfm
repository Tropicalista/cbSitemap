<cfoutput>

<ul>
	<li><a href="#cb.linkHome()#">Home</a>
		<ul>
			<!--- loop over pages --->
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
			<!--- show blog entry point --->
			<cfif prc.cbSettings.cb_site_disable_blog>				
				<li><a href="#cb.linkBlog()#">#prc.cbSettings.cb_site_blog_entrypoint#</a></li>
			</cfif>
		</ul>
	</li>
</ul>

</cfoutput>