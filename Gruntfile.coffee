module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"
    src_path: "src"
    assets_path: "public/assets"
    coffee:
      compile:
        files:
          "<%= assets_path %>/app/app.js": ["<%= src_path %>/app/app.coffee"]
          "<%= assets_path %>/app/controllers.js": ["<%= src_path %>/app/controllers/*.coffee"]
          "<%= assets_path %>/app/config.js": ["<%= src_path %>/app/config/*.coffee"]
    sass:
      options:
        sourceMap: true
        includePaths: [
          "<%= src_path %>/sass"
        ]
      dist:
        files:
          "<%= assets_path %>/css/<%= pkg.name %>.css": "<%= src_path %>/sass/application.sass"
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
        src: "<%= assets_path %>/css/<%= pkg.name %>.css"
        dest: "<%= assets_path %>/css/<%= pkg.name %>.prefixed.css"
    uglify:
      options:
        mangle: false
      target:
        files:
          "<%= assets_path %>/js/<%= pkg.name %>.min.js": ["<%= assets_path %>/js/<%= pkg.name %>.js"]
    cssmin:
      target:
        files: [
          expand: true
          cwd: "<%= assets_path %>/css"
          src: ["*.prefixed.css", "!*.min.css"]
          dest: "<%= assets_path %>/css"
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
