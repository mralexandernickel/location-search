module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"
    src_path: "src"
    assets_path: "public/assets"
    coffee:
      dist:
        files:
          "dist/<%= pkg.name %>.js": "<%= src_path %>/coffee/LocationSearch.coffee"
      compile:
        files:
          "<%= assets_path %>/app/app.js": ["<%= src_path %>/app/app.coffee"]
          "<%= assets_path %>/app/controllers.js": ["<%= src_path %>/app/controllers/*.coffee"]
          "<%= assets_path %>/app/directives.js": ["<%= src_path %>/app/directives/*.coffee"]
          "<%= assets_path %>/app/config.js": ["<%= src_path %>/app/config/*.coffee"]
    sass:
      options:
        sourceMap: true
        includePaths: [
          "<%= src_path %>/sass"
        ]
      dist:
        files:
          "dist/<%= pkg.name %>.css": "<%= src_path %>/sass/location-search.sass"
    copy:
      images:
        files: [
          {expand: true, flatten: true, src: ["<%= src_path %>/img/*"], dest: "<%= assets_path %>/img", filter: 'isFile'}
        ]
      mdi:
        files: [
          {expand: true, flatten: true, src: ["<%= src_path %>/lib/mdi/fonts/*"], dest: "<%= assets_path %>/fonts", filter: 'isFile'}
          {expand: true, flatten: true, src: ["<%= src_path %>/lib/mdi/css/*"], dest: "<%= assets_path %>/css", filter: 'isFile'}
        ]
      angular:
        files: [
          {expand: true, flatten: true, src: ["<%= src_path %>/lib/angular/angular*"], dest: "<%= assets_path %>/lib/angular", filter: 'isFile'}
          {expand: true, flatten: true, src: ["<%= src_path %>/lib/angular-material/angular*"], dest: "<%= assets_path %>/lib/angular", filter: 'isFile'}
          {expand: true, flatten: true, src: ["<%= src_path %>/lib/angular-aria/angular*"], dest: "<%= assets_path %>/lib/angular", filter: 'isFile'}
          {expand: true, flatten: true, src: ["<%= src_path %>/lib/angular-animate/angular*"], dest: "<%= assets_path %>/lib/angular", filter: 'isFile'}
          {expand: true, flatten: true, src: ["<%= src_path %>/lib/angular-route/angular*"], dest: "<%= assets_path %>/lib/angular", filter: 'isFile'}
        ]
      views:
        files: [
          {expand: true, flatten: true, src: ["<%= src_path %>/app/views/*.html"], dest: "<%= assets_path %>/app/views", filter: 'isFile'}
          {expand: true, flatten: true, src: ["<%= src_path %>/app/views/layouts/*.html"], dest: "public/", rename: (dest,src) -> dest + src.replace("application","index")}
        ]
    autoprefixer:
      single_file:
        src: "dist/<%= pkg.name %>.css"
        dest: "dist/<%= pkg.name %>.prefixed.css"
    uglify:
      options:
        mangle: false
      target:
        files:
          "dist/<%= pkg.name %>.min.js": ["dist/<%= pkg.name %>.js"]
    cssmin:
      target:
        files: [
          expand: true
          cwd: "dist"
          src: ["*.prefixed.css", "!*.min.css"]
          dest: "dist"
          ext: ".min.css"
        ]
  
  grunt.loadNpmTasks "grunt-sass"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-cssmin"
  grunt.loadNpmTasks "grunt-autoprefixer"

  grunt.registerTask "default", ["coffee","sass","copy"]
  grunt.registerTask "dist",["coffee:dist", "uglify", "sass:dist", "autoprefixer", "cssmin"]
