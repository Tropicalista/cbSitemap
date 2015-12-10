component extends="coldbox.system.Interceptor" {

	property name="sitemap" inject="sitemap@cbSitemap";

	public void function cbadmin_postPageSave(event, interceptData) {
		generateSitemap("page");
	}

	public void function cbadmin_postPageRemove(event, interceptData) {
		generateSitemap("page");
	}

	public void function cbadmin_postEntrySave(event, interceptData) {
		generateSitemap("entry");
	}

	public void function cbadmin_postEntryRemove(event, interceptData) {
		generateSitemap("entry");
	}

	private function generateSitemap( required string type ){
		sitemap.getXML(contentType=arguments.type);
	}

}