module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"
    src_path: "src"
    assets_path: "public/wp-content/themes/rak/assets"
    haml:
      training:
        files:
          "<%= assets_path %>/training/views/TrainingsIndex.html": ["<%= src_path %>/training/views/TrainingsIndex.haml"]
          "<%= assets_path %>/training/views/Trainings.html": ["<%= src_path %>/training/views/Trainings.haml"]
          "<%= assets_path %>/training/views/TrainingsRegistration.html": ["<%= src_path %>/training/views/TrainingsRegistration.haml"]
      dist:
        files:
          "example/index.html": ["<%= src_path %>/haml/index.haml"]
    coffee:
      compile:
        files:
          "<%= assets_path %>/js/<%= pkg.name %>.js": ["<%= src_path %>/coffee/*.coffee"]
          "<%= assets_path %>/training/controllers.js": ["<%= src_path %>/training/controllers/*.coffee"]
          "<%= assets_path %>/training/routes.js": ["<%= src_path %>/training/routes/*.coffee"]
    less:
      development:
        options:
          paths: [
            "<%= src_path %>/lib/bootstrap/less",
            "<%= src_path %>/lib/fontawesome/less",
            "<%= src_path %>/lib/less-easing/less",
            "<%= src_path %>/lib/less-grayscale/less",
            "<%= src_path %>/less"
          ]
        files:
          "<%= assets_path %>/css/<%= pkg.name %>.css": "<%= src_path %>/less/application.less"
    concat:
      bootstrap:
        src: [
          "<%= src_path %>/lib/bootstrap/js/transition.js",
          "<%= src_path %>/lib/bootstrap/js/tooltip.js",
          "<%= src_path %>/lib/bootstrap/js/affix.js",
          "<%= src_path %>/lib/bootstrap/js/alert.js",
          "<%= src_path %>/lib/bootstrap/js/button.js",
          "<%= src_path %>/lib/bootstrap/js/carousel.js",
          "<%= src_path %>/lib/bootstrap/js/collapse.js",
          "<%= src_path %>/lib/bootstrap/js/dropdown.js",
          "<%= src_path %>/lib/bootstrap/js/modal.js",
          "<%= src_path %>/lib/bootstrap/js/popover.js",
          "<%= src_path %>/lib/bootstrap/js/scrollspy.js",
          "<%= src_path %>/lib/bootstrap/js/tab.js"
        ]
        dest: "<%= assets_path %>/lib/bootstrap/bootstrap.js"
    copy:
      main:
        files: [
          {expand: true, flatten: true, src: ["<%= src_path %>/img/*"], dest: "<%= assets_path %>/img", filter: 'isFile'}
        ]
      fonts:
        files: [
          {expand: true, flatten: true, src: ["<%= src_path %>/lib/fontawesome/fonts/*"], dest: "<%= assets_path %>/fonts", filter: 'isFile'}
        ]
      toaster:
        files: [
          {expand: true, flatten: true, src: ["<%= src_path %>/lib/toaster/dist/*"], dest: "<%= assets_path %>/lib/toaster", filter: 'isFile'}
        ]
      grayscsale:
        files: [
          {expand: true, flatten: true, src: ["<%= src_path %>/lib/less-grayscale/filter/*"], dest: "<%= assets_path %>/filter", filter: 'isFile'}
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
  
  grunt.loadNpmTasks "grunt-contrib-haml"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-less"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-cssmin"
  grunt.loadNpmTasks "grunt-autoprefixer"

  grunt.registerTask "default", ["haml","coffee","less","concat","copy"]
