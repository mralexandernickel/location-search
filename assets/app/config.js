(function() {
  app.config(function($routeProvider) {
    return $routeProvider.when("/", {
      controller: "LocationSearchController",
      templateUrl: "assets/app/views/location-search.html"
    }).otherwise({
      redirectTo: "/"
    });
  });

}).call(this);
