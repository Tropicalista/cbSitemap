component {

	property name="entryService"		inject="id:entryService@cb";
	property name="pageService"			inject="id:pageService@cb";
	property name="contentService"		inject="id:contentService@cb";
	property name="CBHelper"			inject="id:CBHelper@cb";

	public function index(){

		// search entries with filters and all
		prc.pageResults = pageService.search( 
			search		= "",
			isPublished	= true,
			category	= "all",
			author		= "all",
			creator		= "all",
			sortOrder	= "order asc" 
		);
		return renderView( view="sitemap", module="cbSitemap" );
	}

}