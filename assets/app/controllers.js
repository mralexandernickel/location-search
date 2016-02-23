(function() {
  var ApplicationController;

  ApplicationController = function($scope) {
    var __construct;
    __construct = function() {
      return console.log("application running");
    };
    return __construct();
  };

  app.controller("ApplicationController", ApplicationController);

}).call(this);
