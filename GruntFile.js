module.exports = function( grunt ){

	// Default
	grunt.registerTask( "default", [ "compress" ] );

	// Build All
	grunt.registerTask( "all", [ "compress" ] );

	// Config
	grunt.initConfig( {
		// read configs
		pkg : grunt.file.readJSON( "package.json" ),

		// make a zipfile
		compress: {
		  main: {
		    options: {
		      archive: 'cbSitemap.zip'
		    },
		    files: [
		      {src: ['README.md'], dest: '/cbSitemap'}, // includes files in path and its subdirs
		      {src: ['ModuleConfig.cfc'], dest: '/cbSitemap'}, // includes files in path and its subdirs
		      {src: ['handlers/**'], dest: '/cbSitemap'}, // includes files in path and its subdirs
		      {src: ['interceptors/**'], dest: '/cbSitemap'}, // includes files in path and its subdirs
		      {src: ['models/**'], dest: '/cbSitemap'}, // includes files in path and its subdirs
		      {src: ['views/**'], dest: '/cbSitemap'}, // includes files in path and its subdirs
		      {src: ['widgets/**'], dest: '/cbSitemap'}, // includes files in path and its subdirs
		    ]
		  }
		}

	} );

	// Load Tasks
	require( 'matchdep' )
		.filterDev( 'grunt-*' )
		.forEach( grunt.loadNpmTasks );
};
