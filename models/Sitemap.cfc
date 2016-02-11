component singleton{

	// DI
	property name="entryService"		inject="id:entryService@cb";
	property name="pageService"			inject="id:pageService@cb";
	property name="contentService"		inject="id:contentService@cb";
	property name="CBHelper"			inject="id:CBHelper@cb";
	property name="appPath" 			inject="coldbox:setting:ApplicationPath";

	/**
 	* Constructor
	*/
	Sitemap function init(){
		return this;
	}

	/************************************** PUBLIC *********************************************/

	/**
	* Build sitemap for contentbox content objects
	* @slug.hint The page or entry slug to filter on.
	* @comments.hint Retrieve the comments RSS feed or content feed, defaults to false
	* @category.hint Filter the content feed with categories
	* @contentType.hint The contentType to build an RSS feed on. Empty is for the site. Available content types are [page,entry]
	*/
	function getXML(string slug="", boolean comments=false, category="", contentType="" ){

		// Content Type
		switch(arguments.contentType){
			// Pages
			case "page" : {
				// Building page sitemap
				sitemapXML = buildPageSitemap(argumentCollection=arguments);
				break;
			}
			// Blog
			case "entry" : {
				// Building entry sitemap
				sitemapXML = buildEntrySitemap(argumentCollection=arguments);
				break;
			}
			// Default Site
			default : {
				// Building sitemap
				sitemapXML = buildContentSitemap(argumentCollection=arguments);
				break;
			}

		} // end content type switch

	}

	/************************************** PRIVATE *********************************************/

	/**
	* Build pages sitemap
	* @category The category to filter on if needed
	*/
	private function buildPageSitemap(category="", numeric maxEntries=5000 ){
		var pageResults 	= pageService.findPublishedPages(category=arguments.category,max=arguments.maxEntries);
		var qPages			= entityToQuery( pageResults.pages );

		// Generate sitemap
		writeSitemap( qPages, "sitemap_pages.xml" );
	}

	/**
	* Build entries sitemap
	* @category The category to filter on if needed
	*/
	private function buildEntrySitemap(category="", numeric maxEntries=5000 ){
		var entryResults 	= entryService.findPublishedEntries(category=arguments.category,max=arguments.maxEntries);
		var qEntries		= entityToQuery( entryResults.entries );

		// Generate sitemap
		writeSitemap( qEntries, "sitemap_entries.xml" );
	}

	/**
	* Build content sitemap
	* @category The category to filter on if needed
	*/
	private function buildContentSitemap(category="", numeric maxEntries=5000 ){
		var contentResults 	= contentService.findPublishedContent(category=arguments.category,max=arguments.maxEntries);
		var qContent		= entityToQuery( contentResults.content );

		// Generate sitemap
		writeSitemap( qContent, "sitemap_content.xml" );
	}

	private function getXmlString( required query sitemap ){
        var result = '<?xml version="1.0" encoding="UTF-8"?><urlset xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9" url="http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd" xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';

		for(var i = 1; i lte arguments.sitemap.RecordCount; i++){
                result = result & buildSitemapUrl( arguments.sitemap['slug'][i], arguments.sitemap['publishedDate'][i] );
        }

        result = result & '</urlset>';

        return result;
	}

	private function buildSitemapUrl( required string loc, required date published, changefreq="monthly", priority="0.5" ){
        var result = '<url>';

        result = result & '<loc>' & xmlFormat( CBHelper.linkPage(arguments.loc) ) & '</loc>';

        if ( structKeyExists(arguments, 'published') AND len(arguments.published) ) {
                result = result & '<lastmod>' & DateFormat(arguments.published, 'yyyy-mm-dd') & '</lastmod>';
        }
        if ( structKeyExists(arguments, 'changefreq') AND len(arguments.changefreq) ) {
                result = result & '<changefreq>' & arguments.changefreq & '</changefreq>';
        }
        if ( structKeyExists(arguments, 'priority') AND len(arguments.priority) ) {
                result = result & '<priority>' & arguments.priority & '</priority>';
        }

        result = result & '</url>';

        return result;		
	}

	private function writeSitemap( required query sitemap, required string name ){
		var xmlString = getXmlString( arguments.sitemap );
		FileWrite( appPath & arguments.name, xmlString, "Utf-8");;
	}

}