component {

	property name="entryService"		inject="id:entryService@cb";
	property name="pageService"			inject="id:pageService@cb";
	property name="contentService"		inject="id:contentService@cb";
	property name="CBHelper"			inject="id:CBHelper@cb";

	public function index(){

		prc.entryResults 	= entryService.findPublishedEntries();
		prc.pageResults 	= pageService.findPublishedPages();
		prc.contentResults 	= contentService.findPublishedContent();

		return renderView( view="sitemap", module="cbSitemap" );
	}

}