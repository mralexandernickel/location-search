(function() {
  var LocationSearch;

  LocationSearch = function($http, $filter, $mdSidenav) {
    var directive;
    return directive = {
      restrict: "E",
      scope: {
        resourceUrl: "@resourceUrl",
        fieldName: "@fieldName",
        fieldStreet: "@fieldStreet",
        fieldZip: "@fieldZip",
        fieldCity: "@fieldCity",
        initialFilters: "@initialFilters",
        maxResults: "@maxResults",
        initialZoom: "@initialZoom",
        fallbackCenter: "@fallbackCenter"
      },
      link: function($scope, elem, attrs) {
        var __construct, clearMarkers, distance, filterNearby, geoSuccessHandler, getCoordinates, getData, getDefaultLatLon, renderMap, setVariables, shuffle, updateMap;
        __construct = function() {
          getDefaultLatLon();
          setVariables();
          return getData();
        };
        setVariables = function() {
          var defaultFilters;
          $scope.initialFilters = $scope.initialFilters.replace(/ +(?= )/g, "").split(" ");
          $scope.maxResults = $scope.maxResults || 5;
          $scope.initialZoom = $scope.initialZoom || 8;
          $scope.radius = $scope.initialRadius || 0;
          $scope.results = [];
          $scope.markers = [];
          $scope.places = [];
          $scope.availableFilters = null;
          $scope.availableRadii = [0, 10, 25, 50, 100];
          $scope.fields = [];
          $scope.addressFields = {
            name: $scope.fieldName,
            street: $scope.fieldStreet,
            zip: $scope.fieldZip,
            city: $scope.fieldCity
          };
          defaultFilters = [$scope.addressFields.city, $scope.addressFields.zip, $scope.addressFields.name];
          return $scope.defaultFilters = $scope.initialFilters || defaultFilters;
        };
        $scope.getUserPosition = function() {
          return navigator.geolocation.getCurrentPosition(geoSuccessHandler, getDefaultLatLon);
        };
        $scope.filterPlaces = function(field) {
          var activeField, activeFields, fields, filterByTerm, k, len, result;
          activeFields = $scope.fields.filter(function(item) {
            return item.checked;
          });
          fields = [];
          for (k = 0, len = activeFields.length; k < len; k++) {
            activeField = activeFields[k];
            fields.push(activeField.label);
          }
          if ($scope.search.length < 2) {
            $scope.results = [];
          } else {
            filterByTerm = function(item) {
              var chunk, chunks, l, len1, len2, n, property, result;
              result = false;
              chunks = $scope.search.split(" ");
              for (l = 0, len1 = chunks.length; l < len1; l++) {
                chunk = chunks[l];
                for (n = 0, len2 = fields.length; n < len2; n++) {
                  property = fields[n];
                  if (item[property]) {
                    if (item[property].toLowerCase().indexOf(chunk.toLowerCase()) >= 0) {
                      result = true;
                    }
                  }
                }
              }
              return result;
            };
            result = $filter("filter")($scope.places, filterByTerm);
            if ($scope.radius > 0) {
              result = filterNearby(result);
            }
            $scope.results = shuffle(result);
          }
          return updateMap();
        };
        filterNearby = function(places) {
          var filterByDistance, result;
          filterByDistance = function(item) {
            return distance($scope.userLat, $scope.userLon, item.latitude, item.longitude, "K") <= $scope.radius;
          };
          result = $filter("filter")(places, filterByDistance);
          return result;
        };
        $scope.getNearby = function() {
          $scope.results = shuffle(filterNearby($scope.places));
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
                address: place[$scope.addressFields.street] + " " + place[$scope.addressFields.zip] + " " + place[$scope.addressFields.city]
              };
              results1.push((function(item) {
                return geocoder.geocode(data, function(results, status) {
                  var location, marker;
                  location = results[0].geometry.location;
                  bounds.extend(new google.maps.LatLng(location.lat(), location.lng()));
                  $scope.map.fitBounds(bounds);
                  $scope.map.setCenter(bounds.getCenter());
                  marker = new google.maps.Marker({
                    map: $scope.map,
                    position: location
                  });
                  item.marker = marker;
                  marker.addListener("click", function() {
                    var i, l, len1, len2, m, n, ref1, ref2;
                    ref1 = $scope.markers;
                    for (l = 0, len1 = ref1.length; l < len1; l++) {
                      m = ref1[l];
                      m.setAnimation(null);
                    }
                    ref2 = $scope.results;
                    for (n = 0, len2 = ref2.length; n < len2; n++) {
                      i = ref2[n];
                      i.active = false;
                    }
                    item.active = true;
                    this.setAnimation(google.maps.Animation.BOUNCE);
                    return $scope.$apply();
                  });
                  return $scope.markers.push(marker);
                });
              })(place));
            }
            return results1;
          } else {
            clearMarkers();
            $scope.map.setZoom($scope.initialZoom);
            return $scope.map.setCenter($scope.initialCenter);
          }
        };
        $scope.cardOrder = null;
        $scope.setInactive = function(place) {
          return place.active = false;
        };
        $scope.setActive = function(place) {
          var i, k, l, len, len1, marker, ref, ref1;
          ref = $scope.markers;
          for (k = 0, len = ref.length; k < len; k++) {
            marker = ref[k];
            marker.setAnimation(null);
          }
          ref1 = $scope.places;
          for (l = 0, len1 = ref1.length; l < len1; l++) {
            i = ref1[l];
            i.active = false;
          }
          place.active = true;
          return place.marker.setAnimation(google.maps.Animation.BOUNCE);
        };
        geoSuccessHandler = function(position) {
          $scope.userLat = position.coords.latitude;
          $scope.userLon = position.coords.longitude;
          $scope.initialCenter = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
          $scope.$apply();
          return renderMap();
        };
        distance = function(lat1, lon1, lat2, lon2, unit) {
          var dist, radlat1, radlat2, radtheta, theta;
          radlat1 = Math.PI * lat1 / 180;
          radlat2 = Math.PI * lat2 / 180;
          theta = lon1 - lon2;
          radtheta = Math.PI * theta / 180;
          dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
          dist = Math.acos(dist);
          dist = dist * 180 / Math.PI;
          dist = dist * 60 * 1.1515;
          if (unit === "K") {
            dist = dist * 1.609344;
          }
          if (unit === "N") {
            dist = dist * 0.8684;
          }
          return dist;
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
        $scope.toggleSidenav = function() {
          return $mdSidenav("left").toggle();
        };
        getDefaultLatLon = function() {
          var data, geocoder;
          geocoder = new google.maps.Geocoder;
          data = {
            address: $scope.fallbackCenter
          };
          return geocoder.geocode(data, function(results, status) {
            var location;
            location = results[0].geometry.location;
            $scope.initialCenter = new google.maps.LatLng(location.lat(), location.lng());
            return renderMap();
          });
        };
        getCoordinates = function() {
          return console.log($scope.places.length);

          /*
          for place in $scope.places[..200]
            data =
              address: "#{place[$scope.addressFields.street]} #{place[$scope.addressFields.zip]} #{place[$scope.addressFields.city]}"
            geocoder.geocode data, (results, status) ->
              console.log status
              console.log results
              location = results[0].geometry.location
           */
        };
        getData = function() {
          return $http.get($scope.resourceUrl).success(function(d) {
            var key, ref, value;
            ref = d[0];
            for (key in ref) {
              value = ref[key];
              $scope.fields.push({
                label: key,
                checked: $scope.defaultFilters.indexOf(key) >= 0 ? true : false
              });
            }
            $scope.places = d;
            return getCoordinates();
          });
        };
        return __construct();
      },
      template: "<md-sidenav class=\"md-sidenav-left md-whiteframe-z2 sidenav-filter\" md-component-id=\"left\">\n    <md-tabs md-stretch-tabs=\"always\" flex md-align-tabs=\"bottom\">\n      <md-tab>\n        <md-tab-label>\n          <span><md-icon md-font-icon=\"mdi-magnify\" class=\"mdi\"></md-icon></span>\n        </md-tab-label>\n        <md-tab-body>\n          <md-content class=\"md-padding\">\n            <h2 class=\"md-headline\">Search Nearby</h2>\n            <p class=\"md-body-1\" ng-if=\"!userLat\">We need your Location to enable Nearby-Search</p>\n            <md-button ng-click=\"getUserPosition()\" class=\"md-raised md-primary\" ng-if=\"!userLat\">Get Position</md-button>\n            <md-input-container class=\"md-block\">\n              <label>Radius</label>\n              <md-select\n                ng-model=\"radius\"\n                ng-value=\"radius\"\n                ng-disabled=\"!userLat\"\n                ng-change=\"getNearby()\">\n                <md-option ng-repeat=\"availableRadius in availableRadii\" value=\"{{availableRadius}}\">{{availableRadius}}</md-option>\n              </md-select>\n            </md-input-container>\n          </md-content>\n        </md-tab-body>\n      </md-tab>\n      <md-tab>\n        <md-tab-label>\n          <span><md-icon md-font-icon=\"mdi-filter-variant\" class=\"mdi\"></md-icon></span>\n        </md-tab-label>\n        <md-tab-body>\n          <md-content class=\"md-padding\">\n            <md-switch class=\"md-primary\" ng-repeat=\"field in fields\"\n                       ng-model=\"field.checked\"\n                       aria-label=\"{{field.label}}\">{{field.label}}</md-switch>\n          </md-content>\n        </md-tab-body>\n      </md-tab>\n    </md-tabs>\n</md-sidenav>\n<md-content flex layout-padding>\n  <md-button class=\"md-icon-button toggleSidenav\" ng-click=\"toggleSidenav()\">\n    <md-icon class=\"mdi\" md-font-icon=\"mdi-settings\"></md-icon>\n  </md-button>\n  <md-button class=\"md-icon-button getPosition\" ng-click=\"getUserPosition()\">\n    <md-icon class=\"mdi\" md-font-icon=\"mdi-crosshairs-gps\"></md-icon>\n  </md-button>\n  <input id=\"gmapSearch\" type=\"text\" ng-model=\"search\" ng-model-options=\"{debounce: 700}\" ng-change=\"filterPlaces()\" placeholder=\"Search\">\n  <div id=\"gmapSearchContainer\"></div>\n</md-content>\n<md-sidenav class=\"md-sidenav-right md-whiteframe-z2\" md-component-id=\"right\" md-is-locked-open=\"results.length > 0\">\n  <md-content layout-padding>\n    <md-card ng-repeat=\"place in results | orderBy: cardOrder\"\n             ng-click=\"setActive(place)\"\n             ng-class=\"{active: place.active}\">\n      <md-card-content>\n        <md-button class=\"md-raised\" ng-if=\"place.active\" ng-click=\"setInactive(place)\">Close</md-button>\n        <h2 class=\"md-title\">{{place[addressFields.name]}}</h2>\n        <p class=\"md-body-1\">{{place[addressFields.street]}}<br>\n        {{place[addressFields.zip]}} {{place[addressFields.city]}}</p>\n      <md-card-content>\n    </md-card>\n  </md-content>\n</md-sidenav>"
    };
  };

  angular.module("nickel.locationSearch", ["ngMaterial"]).directive("locationSearch", LocationSearch);

}).call(this);
