/**
* A cool sitemap widget for ContentBox
*/
component extends="contentbox.models.ui.BaseWidget" singleton{

	Sitemap function init(controller){
		// super init
		super.init(controller);

		// Widget Properties
		setName("Sitemap");
		setVersion("1.0");
		setDescription("A cool sitemap widget for ContentBox.");
		setAuthor("Tropicalista");
		setAuthorURL("http://www.tropicalseo.net");
		setIcon( "comment-add.png" );
		setCategory( "Miscellaneous" );
		return this;
	}

	/**
	* The mortgage plan widget
	*/
	any function renderIt(){

		var sitemap = runEvent(event='cbSitemap:main.index');
		
		return sitemap;

	}

}
