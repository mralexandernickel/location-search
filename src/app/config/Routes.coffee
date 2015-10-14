app.config ($routeProvider) ->
  $routeProvider
    .when "/",
      controller: "LocationSearchController"
      templateUrl: "assets/app/views/location-search.html"
    .otherwise
      redirectTo: "/"
