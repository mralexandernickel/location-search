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

(function() {
  var LocationSearchController;

  LocationSearchController = function($scope, $http, $filter) {
    var __construct, clearMarkers, geoSuccessHandler, getData, renderMap, shuffle, updateMap;
    __construct = function() {
      getData();
      return navigator.geolocation.getCurrentPosition(geoSuccessHandler);
    };
    $scope.maxResults = 5;
    $scope.initialZoom = 8;
    $scope.results = [];
    $scope.markers = [];
    $scope.places = [];
    $scope.filterPlaces = function() {
      var fields, filterArgs, result;
      fields = ["Hauptkanzlei_Ort", "Hauptkanzlei_PLZ", "Name"];
      if ($scope.search.length < 2) {
        $scope.results = [];
      } else {
        filterArgs = function(item) {
          var chunk, chunks, k, l, len, len1, property, result;
          result = false;
          chunks = $scope.search.split(" ");
          for (k = 0, len = chunks.length; k < len; k++) {
            chunk = chunks[k];
            for (l = 0, len1 = fields.length; l < len1; l++) {
              property = fields[l];
              if (item[property]) {
                if (item[property].toLowerCase().indexOf(chunk.toLowerCase()) >= 0) {
                  result = true;
                }
              }
            }
          }
          return result;
        };
        result = $filter("filter")($scope.places, filterArgs);
        $scope.results = shuffle(result);
      }
      return updateMap();
    };
    shuffle = function(array) {
      var i, j, temp;
      i = array.length - 1;
      while (i > 0) {
        j = Math.floor(Math.random() * (i + 1));
        temp = array[i];
        array[i] = array[j];
        array[j] = temp;
        i--;
      }
      return array.slice(0, $scope.maxResults);
    };
    clearMarkers = function() {
      var k, len, marker, ref;
      ref = $scope.markers;
      for (k = 0, len = ref.length; k < len; k++) {
        marker = ref[k];
        marker.setMap(null);
      }
      return $scope.markers = [];
    };
    updateMap = function() {
      var bounds, data, geocoder, k, len, place, ref, results1;
      if ($scope.results.length > 0) {
        bounds = new google.maps.LatLngBounds;
        geocoder = new google.maps.Geocoder;
        clearMarkers();
        ref = $scope.results;
        results1 = [];
        for (k = 0, len = ref.length; k < len; k++) {
          place = ref[k];
          data = {
            address: place.Hauptkanzlei_Strasse + " " + place.Hauptkanzlei_PLZ + " " + place.Hauptkanzlei_Ort
          };
          results1.push(geocoder.geocode(data, (function(results, status) {
            var location, marker;
            location = results[0].geometry.location;
            bounds.extend(new google.maps.LatLng(location.lat(), location.lng()));
            $scope.map.fitBounds(bounds);
            $scope.map.setCenter(bounds.getCenter());
            marker = new google.maps.Marker({
              map: $scope.map,
              position: location
            });
            return $scope.markers.push(marker);
          }).bind(place)));
        }
        return results1;
      } else {
        clearMarkers();
        $scope.map.setZoom($scope.initialZoom);
        return $scope.map.setCenter($scope.initialCenter);
      }
    };
    geoSuccessHandler = function(position) {
      $scope.initialCenter = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
      return renderMap();
    };
    renderMap = function() {
      var mapOptions;
      mapOptions = {
        zoom: $scope.initialZoom,
        scrollwheel: false,
        disableDefaultUI: true,
        center: $scope.initialCenter
      };
      return $scope.map = new google.maps.Map(document.getElementById("gmapSearchContainer"), mapOptions);
    };
    getData = function() {
      return $http.get("data/mitglieder.json").success(function(d) {
        return $scope.places = d;
      });
    };
    return __construct();
  };

  app.controller("LocationSearchController", LocationSearchController);

}).call(this);
