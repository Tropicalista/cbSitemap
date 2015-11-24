/**
* 
*/
component {

	// Module Properties
	this.title 				= "cbSitemap";
	this.author 			= "Francesco Pepe";
	this.webURL 			= "http://www.tropicalseo.net";
	this.description 		= "A simple module that create pages/entries sitemap hen you create/delete content.";
	this.version			= "1.0.0";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= false;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint			= "cbSitemap";
	this.modelNamespace		= "cbSitemap";

	function configure(){

  		settings = {
		};

		// SES Routes
		routes = [
			// Module Entry Point
			{pattern="/", handler="home",action="index"},
			// Convention Route
			{pattern="/:handler/:action?"}
		];

		// Interceptors
		interceptors = [
			{ class="#moduleMapping#.interceptors.Sitemap", properties={ entryPoint="cbadmin" }, name="Sitemap@cbSitemap" }
		];

	}

	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){}

	function onActivate() {
		var settingService = controller.getWireBox().getInstance("SettingService@cb");
		// store default settings
		var findArgs = { name="cb_sitemap_cacheName" };
		var setting = settingService.findWhere( criteria=findArgs );
		if( isNull( setting ) ){
			var args = { name="cb_sitemap_cacheName", value="template"};
			var settings = settingService.new( properties=args );
			settingService.save( settings );
		}
	}

	/**
	* Fired when the module is unregistered and unloaded
	*/
	function onUnload(){

		var settingService = controller.getWireBox().getInstance("SettingService@cb");
		var args = { name="cb_sitemap_cacheName" };
		var setting = settingService.findWhere( criteria=args );
		if( !isNull( setting ) ){
			settingService.delete( setting );
		}

	}

}
