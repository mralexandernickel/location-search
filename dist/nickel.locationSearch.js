(function() {
  var LocationSearch, gmapStyles, markerStyle_1, markerStyle_2;

  if (!gmapStyles) {
    gmapStyles = {};
  }

  gmapStyles.style1 = [
    {
      'featureType': 'water',
      'elementType': 'geometry',
      'stylers': [
        {
          'color': '#e9e9e9'
        }, {
          'lightness': 17
        }
      ]
    }, {
      'featureType': 'landscape',
      'elementType': 'geometry',
      'stylers': [
        {
          'color': '#f5f5f5'
        }, {
          'lightness': 20
        }
      ]
    }, {
      'featureType': 'road.highway',
      'elementType': 'geometry.fill',
      'stylers': [
        {
          'color': '#ffffff'
        }, {
          'lightness': 17
        }
      ]
    }, {
      'featureType': 'road.highway',
      'elementType': 'geometry.stroke',
      'stylers': [
        {
          'color': '#ffffff'
        }, {
          'lightness': 29
        }, {
          'weight': 0.2
        }
      ]
    }, {
      'featureType': 'road.arterial',
      'elementType': 'geometry',
      'stylers': [
        {
          'color': '#ffffff'
        }, {
          'lightness': 18
        }
      ]
    }, {
      'featureType': 'road.local',
      'elementType': 'geometry',
      'stylers': [
        {
          'color': '#ffffff'
        }, {
          'lightness': 16
        }
      ]
    }, {
      'featureType': 'poi',
      'elementType': 'geometry',
      'stylers': [
        {
          'color': '#f5f5f5'
        }, {
          'lightness': 21
        }
      ]
    }, {
      'featureType': 'poi.park',
      'elementType': 'geometry',
      'stylers': [
        {
          'color': '#dedede'
        }, {
          'lightness': 21
        }
      ]
    }, {
      'elementType': 'labels.text.stroke',
      'stylers': [
        {
          'visibility': 'on'
        }, {
          'color': '#ffffff'
        }, {
          'lightness': 16
        }
      ]
    }, {
      'elementType': 'labels.text.fill',
      'stylers': [
        {
          'saturation': 36
        }, {
          'color': '#333333'
        }, {
          'lightness': 40
        }
      ]
    }, {
      'elementType': 'labels.icon',
      'stylers': [
        {
          'visibility': 'off'
        }
      ]
    }, {
      'featureType': 'transit',
      'elementType': 'geometry',
      'stylers': [
        {
          'color': '#f2f2f2'
        }, {
          'lightness': 19
        }
      ]
    }, {
      'featureType': 'administrative',
      'elementType': 'geometry.fill',
      'stylers': [
        {
          'color': '#fefefe'
        }, {
          'lightness': 20
        }
      ]
    }, {
      'featureType': 'administrative',
      'elementType': 'geometry.stroke',
      'stylers': [
        {
          'color': '#fefefe'
        }, {
          'lightness': 17
        }, {
          'weight': 1.2
        }
      ]
    }
  ];

  gmapStyles.style2 = [
    {
      'featureType': 'administrative',
      'elementType': 'labels.text.fill',
      'stylers': [
        {
          'color': '#444444'
        }
      ]
    }, {
      'featureType': 'administrative.country',
      'elementType': 'geometry.fill',
      'stylers': [
        {
          'visibility': 'on'
        }
      ]
    }, {
      'featureType': 'administrative.province',
      'elementType': 'labels.icon',
      'stylers': [
        {
          'hue': '#ff0000'
        }, {
          'visibility': 'on'
        }
      ]
    }, {
      'featureType': 'landscape',
      'elementType': 'all',
      'stylers': [
        {
          'color': '#f2f2f2'
        }
      ]
    }, {
      'featureType': 'poi',
      'elementType': 'all',
      'stylers': [
        {
          'visibility': 'off'
        }
      ]
    }, {
      'featureType': 'road',
      'elementType': 'all',
      'stylers': [
        {
          'saturation': -100
        }, {
          'lightness': 45
        }
      ]
    }, {
      'featureType': 'road.highway',
      'elementType': 'all',
      'stylers': [
        {
          'visibility': 'simplified'
        }
      ]
    }, {
      'featureType': 'road.arterial',
      'elementType': 'labels.icon',
      'stylers': [
        {
          'visibility': 'off'
        }
      ]
    }, {
      'featureType': 'transit',
      'elementType': 'all',
      'stylers': [
        {
          'visibility': 'off'
        }
      ]
    }, {
      'featureType': 'water',
      'elementType': 'all',
      'stylers': [
        {
          'color': '#46bcec'
        }, {
          'visibility': 'on'
        }
      ]
    }
  ];

  gmapStyles.style3 = [
    {
      'featureType': 'administrative',
      'elementType': 'labels.text.fill',
      'stylers': [
        {
          'color': '#999999'
        }
      ]
    }, {
      'featureType': 'administrative.country',
      'elementType': 'geometry.fill',
      'stylers': [
        {
          'visibility': 'on'
        }
      ]
    }, {
      'featureType': 'administrative.province',
      'elementType': 'labels.icon',
      'stylers': [
        {
          'hue': '#fcb034'
        }, {
          'visibility': 'on'
        }
      ]
    }, {
      'featureType': 'landscape',
      'elementType': 'all',
      'stylers': [
        {
          'color': '#f4f4f4'
        }
      ]
    }, {
      'featureType': 'poi',
      'elementType': 'all',
      'stylers': [
        {
          'visibility': 'off'
        }
      ]
    }, {
      'featureType': 'road',
      'elementType': 'all',
      'stylers': [
        {
          'saturation': -100
        }, {
          'lightness': 45
        }
      ]
    }, {
      'featureType': 'road.highway',
      'elementType': 'all',
      'stylers': [
        {
          'visibility': 'simplified'
        }
      ]
    }, {
      'featureType': 'road.arterial',
      'elementType': 'labels.icon',
      'stylers': [
        {
          'visibility': 'off'
        }
      ]
    }, {
      'featureType': 'transit',
      'elementType': 'all',
      'stylers': [
        {
          'visibility': 'off'
        }
      ]
    }, {
      'featureType': 'water',
      'elementType': 'all',
      'stylers': [
        {
          'color': '#1b99d6'
        }, {
          'visibility': 'on'
        }
      ]
    }
  ];

  markerStyle_1 = "M12,11.5A2.5,2.5 0 0,1 9.5,9A2.5,2.5 0 0,1 12,6.5A2.5,2.5 0 0,1 14.5,9A2.5,2.5 0 0,1 12,11.5M12,2A7,7 0 0,0 5,9C5,14.25 12,22 12,22C12,22 19,14.25 19,9A7,7 0 0,0 12,2Z";

  markerStyle_2 = "M 12,2 C 8.3348086,2 5,5.3348086 5,9 c 0,5.25 7,13 7,13 0,0 7,-7.75 7,-13 0,-3.6651914 -3.334809,-7 -7,-7 z";

  LocationSearch = function($http, $filter, $compile) {
    var directive;
    return directive = {
      restrict: "EA",
      priority: 2,
      controller: function($scope, $filter) {
        this.getUserPosition = function() {
          return navigator.geolocation.getCurrentPosition($scope.geoSuccessHandler, $scope.getDefaultLatLon);
        };
        this.geoSuccessHandler = function(position) {
          $scope.userLat = position.coords.latitude;
          $scope.userLon = position.coords.longitude;
          $scope.initialCenter = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
          $scope.$apply();
          return $scope.map.panTo($scope.initialCenter);
        };
        this.getDefaultLatLon = function(err) {
          var data;
          data = {
            address: $scope.fallbackCenter
          };
          return $scope.geocoder.geocode(data, function(results, status) {
            var location;
            location = results[0].geometry.location;
            $scope.initialCenter = new google.maps.LatLng(location.lat(), location.lng());
            return $scope.map.panTo($scope.initialCenter);
          });
        };
        this.openModal = function(index) {
          var place;
          place = $scope.results[index];
          console.info(place);
          return $scope.modalPlace = place;
        };
        this.closeModal = function() {
          return $scope.modalPlace = false;
        };
        this.shuffle = function(array, maxResults) {
          var i, j, shuffled, temp;
          if (maxResults == null) {
            maxResults = $scope.maxResults;
          }
          i = array.length - 1;
          while (i > 0) {
            j = Math.floor(Math.random() * (i + 1));
            temp = array[i];
            array[i] = array[j];
            array[j] = temp;
            i--;
          }
          shuffled = array.slice(0, maxResults);
          return $filter("orderBy")(shuffled, "distance");
        };
        this.distance = function(lat1, lon1, lat2, lon2, unit) {
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
        this.clearMarkers = function() {
          var k, len, marker, ref;
          ref = $scope.markers;
          for (k = 0, len = ref.length; k < len; k++) {
            marker = ref[k];
            marker.setMap(null);
          }
          return $scope.markers = [];
        };
        this.markerSymbol = function(color, strokeColor, scale, strokeWeight) {
          var symbol;
          if (color == null) {
            color = "#000";
          }
          if (strokeColor == null) {
            strokeColor = "#fff";
          }
          if (scale == null) {
            scale = 1.9;
          }
          if (strokeWeight == null) {
            strokeWeight = 2;
          }
          symbol = {
            path: markerStyle_2,
            fillColor: color,
            fillOpacity: 1,
            strokeColor: strokeColor,
            strokeWeight: strokeWeight,
            scale: scale,
            anchor: new google.maps.Point(11.7, 22),
            labelOrigin: new google.maps.Point(12, 10)
          };
          return symbol;
        };
        this.markerLabel = function(text, color, size, weight) {
          var label;
          if (color == null) {
            color = "#ffffff";
          }
          if (size == null) {
            size = "16px";
          }
          if (weight == null) {
            weight = "800";
          }
          label = {
            color: color,
            fontSize: size,
            fontWeight: weight,
            text: text
          };
          return label;
        };
        this.updateMap = function() {
          var bounds, index, k, len, place, ref, results1;
          if ($scope.results.length) {
            bounds = new google.maps.LatLngBounds;
            $scope.clearMarkers();
            ref = $scope.results;
            results1 = [];
            for (index = k = 0, len = ref.length; k < len; index = ++k) {
              place = ref[index];
              results1.push((function(item) {
                var marker, position;
                position = new google.maps.LatLng(place.lat, place.lon);
                bounds.extend(position);
                $scope.map.fitBounds(bounds);
                marker = new google.maps.Marker({
                  map: $scope.map,
                  position: position,
                  icon: $scope.markerSymbol(),
                  label: $scope.markerLabel($scope.alphabet[index])
                });
                place.marker = marker;
                marker.addListener("click", function() {
                  $scope.toggleActive(item);
                  return $scope.$apply();
                });
                $scope.markers.push(marker);
                if (index === $scope.results.length - 1) {
                  $scope.mapCenter = bounds.getCenter();
                  return $scope.map.panTo($scope.mapCenter);
                }
              })(place));
            }
            return results1;
          } else {
            $scope.clearMarkers();
            $scope.map.setZoom($scope.initialZoom);
            return $scope.map.panTo($scope.initialCenter);
          }
        };
        this.renderMap = function() {
          var mapOptions;
          mapOptions = {
            maxZoom: $scope.maxZoom,
            zoom: $scope.initialZoom,
            scrollwheel: false,
            disableDefaultUI: true
          };
          if ($scope.mapStyle) {
            mapOptions.styles = gmapStyles[$scope.mapStyle];
          }
          $scope.map = new google.maps.Map(document.getElementById("gmapSearchContainer"), mapOptions);
          return google.maps.event.addListenerOnce($scope.map, "idle", function() {
            return console.info("MAP IS READY");
          });
        };
        this.setInactive = function(place) {
          place.marker.setIcon($scope.markerSymbol());
          return place.active = false;
        };
        this.toggleActive = function(place) {
          if (place.active) {
            return $scope.setInactive(place);
          } else {
            return $scope.setActive(place);
          }
        };
        this.setActive = function(place) {
          var i, k, l, len, len1, marker, ref, ref1;
          ref = $scope.markers;
          for (k = 0, len = ref.length; k < len; k++) {
            marker = ref[k];
            marker.setIcon($scope.markerSymbol());
          }
          ref1 = $scope.places;
          for (l = 0, len1 = ref1.length; l < len1; l++) {
            i = ref1[l];
            i.active = false;
          }
          place.active = true;
          return place.marker.setIcon($scope.markerSymbol("#c4301a"));
        };
        this.showDirection = function(place, event) {
          var url, win;
          event.stopPropagation();
          url = "https://www.google.com/maps/dir/" + $scope.userLat + "," + $scope.userLon + "/" + place.lat + "," + place.lon + "/";
          win = window.open(url, "_blank");
          return win.focus();
        };
        this.getFallbackResults = function() {
          return $scope.results = $scope.shuffle($scope.places);
        };
        this.filterPlaces = function() {
          var maxDistance, result;
          maxDistance = 10;
          if ($scope.search.length < 2 && $scope.radius <= 0) {
            $scope.getFallbackResults();
            return $scope.updateMap();
          } else {
            result = $scope.filterTerm($scope.places);
            console.log("RESULT length", result.length);
            if ($scope.radius > 0) {
              if (!result.length) {
                console.info("BLAAAAAAAAA");
                return $scope.getNearby();
              } else {
                return $scope.geocoder.geocode({
                  address: $scope.search
                }, function(results) {
                  var location;
                  location = results[0].geometry.location;
                  result = $scope.filterNearby(result, location);
                  while (!result.length < $scope.maxResults && maxDistance <= 1000) {
                    maxDistance += maxDistance;
                    result = $scope.filterNearby($scope.places, location, maxDistance);
                  }
                  $scope.results = result;
                  $scope.$apply();
                  return $scope.updateMap();
                });
              }
            } else {
              if (!result.length) {
                console.info("nothing found in dataset, try to geocode and get nearby");
                return $scope.geocoder.geocode({
                  address: $scope.search
                }, function(results) {
                  var location;
                  location = results[0].geometry.location;
                  result = $scope.filterNearby($scope.places, location, maxDistance);
                  while (!result.length < $scope.maxResults && maxDistance <= 1000) {
                    maxDistance += maxDistance;
                    result = $scope.filterNearby($scope.places, location, maxDistance);
                  }
                  $scope.results = result;
                  $scope.$apply();
                  return $scope.updateMap();
                });
              } else {
                $scope.results = $scope.shuffle(result);
                return $scope.updateMap();
              }
            }
          }
        };
        this.filterNearby = function(places, location, maxDistance, maxResults) {
          var filterByDistance, ordered, result, sourceLat, sourceLon;
          if (location == null) {
            location = false;
          }
          if (maxDistance == null) {
            maxDistance = $scope.radius;
          }
          if (maxResults == null) {
            maxResults = $scope.maxResults;
          }
          if (location) {
            sourceLat = location.lat();
            sourceLon = location.lng();
          } else {
            sourceLat = $scope.userLat;
            sourceLon = $scope.userLon;
          }
          filterByDistance = function(item, index) {
            item.distance = $scope.distance(sourceLat, sourceLon, item.lat, item.lon, "K");
            return item.distance <= maxDistance;
          };
          result = $filter("filter")(places, filterByDistance);
          ordered = $filter("orderBy")(result, "distance");
          return ordered.slice(0, maxResults);
        };
        this.getNearby = function() {
          var maxDistance, places, result;
          places = $scope.places;
          if ($scope.search.length) {
            return $scope.geocoder.geocode({
              address: $scope.search
            }, function(results) {
              var location, result;
              location = results[0].geometry.location;
              result = $scope.filterNearby(places, location);
              $scope.results = result;
              $scope.updateMap();
              return $scope.$apply();
            });
          } else {
            result = $scope.filterNearby(places);
            maxDistance = 10;
            while (!result.length < $scope.maxResults && maxDistance <= 1000) {
              maxDistance += maxDistance;
              result = $scope.filterNearby(places, false, maxDistance);
            }
            $scope.results = result;
            return $scope.updateMap();
          }
        };
        this.filterTerm = function(places) {
          var activeField, activeFields, fields, filterByTerm, k, len, result;
          activeFields = $scope.fields.filter(function(item) {
            return item.checked;
          });
          fields = [];
          for (k = 0, len = activeFields.length; k < len; k++) {
            activeField = activeFields[k];
            fields.push(activeField.label);
          }
          filterByTerm = function(item, index) {
            var chunk, chunkFound, chunks, l, len1, len2, m, property, result, results;
            result = false;
            if ($scope.userLat) {
              item.distance = $scope.distance($scope.userLat, $scope.userLon, item.lat, item.lon, "K");
            }
            chunks = $scope.search.split(" ");
            results = [];
            for (l = 0, len1 = chunks.length; l < len1; l++) {
              chunk = chunks[l];
              chunkFound = false;
              for (m = 0, len2 = fields.length; m < len2; m++) {
                property = fields[m];
                if (item[property]) {
                  if (item[property].toLowerCase().indexOf(chunk.toLowerCase()) >= 0) {
                    chunkFound = true;
                  }
                }
              }
              results.push(chunkFound);
            }
            return results.every(function(item) {
              return item;
            });
          };
          result = $filter("filter")(places, filterByTerm);
          return $filter("orderBy")(result, "distance");
        };
        this.getData = function() {
          console.info("IN PARENT");
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
            $scope.getFallbackResults();
            return $scope.updateMap();
          });
        };
        this.getTemplate = function() {
          return "<md-sidenav class=\"md-sidenav-left md-whiteframe-z2 sidenav-filter\" md-component-id=\"left\">\n  <md-tabs md-stretch-tabs=\"always\" flex md-align-tabs=\"bottom\">\n    <md-tab>\n      <md-tab-label>\n        <span><md-icon md-font-icon=\"mdi-magnify\" class=\"mdi\"></md-icon></span>\n      </md-tab-label>\n      <md-tab-body>\n        <md-content class=\"md-padding\">\n          <h2 class=\"md-headline\">Search Nearby</h2>\n          <p class=\"md-body-1\" ng-if=\"!userLat\">We need your Location to enable Nearby-Search</p>\n          <md-button ng-click=\"getUserPosition()\" class=\"md-raised md-primary\" ng-if=\"!userLat\">Get Position</md-button>\n          <md-input-container class=\"md-block\">\n            <label>Radius</label>\n            <md-select\n              ng-model=\"radius\"\n              ng-value=\"radius\"\n              ng-disabled=\"!userLat\"\n              ng-change=\"getNearby()\">\n              <md-option ng-repeat=\"availableRadius in availableRadii\" value=\"{{availableRadius}}\">{{availableRadius}}</md-option>\n            </md-select>\n          </md-input-container>\n        </md-content>\n      </md-tab-body>\n    </md-tab>\n    <md-tab>\n      <md-tab-label>\n        <span><md-icon md-font-icon=\"mdi-filter-variant\" class=\"mdi\"></md-icon></span>\n      </md-tab-label>\n      <md-tab-body>\n        <md-content class=\"md-padding\">\n          <md-switch\n            class=\"md-primary\" ng-repeat=\"field in fields\"\n            ng-model=\"field.checked\"\n            aria-label=\"{{field.label}}\">{{field.label}}</md-switch>\n        </md-content>\n      </md-tab-body>\n    </md-tab>\n  </md-tabs>\n</md-sidenav>\n<md-content flex layout-padding>\n  <md-button class=\"md-icon-button toggleSidenav\" ng-click=\"toggleSidenav()\">\n    <md-icon class=\"mdi\" md-font-icon=\"mdi-settings\"></md-icon>\n  </md-button>\n  <md-button class=\"md-icon-button getPosition\" ng-click=\"getUserPosition()\">\n    <md-icon class=\"mdi\" md-font-icon=\"mdi-crosshairs-gps\"></md-icon>\n  </md-button>\n  <input id=\"gmapSearch\" type=\"text\" ng-model=\"search\" ng-model-options=\"{debounce: 700}\" ng-change=\"filterPlaces()\" placeholder=\"Search\">\n  <div id=\"gmapSearchContainer\"></div>\n</md-content>\n<md-sidenav class=\"md-sidenav-right md-whiteframe-z2\" md-component-id=\"right\" md-is-locked-open=\"results.length > 0\">\n  <md-content layout-padding>\n    <md-card\n      ng-repeat=\"place in results | orderBy: cardOrder\"\n      ng-click=\"toggleActive(place)\"\n      ng-class=\"{active: place.active}\">\n      <md-card-content>\n        <h2 class=\"md-title\">{{place[addressFields.name]}}</h2>\n        <p class=\"md-body-1\">{{place[addressFields.street]}}<br>\n        {{place[addressFields.zip]}} {{place[addressFields.city]}}</p>\n      <md-card-content>\n    </md-card>\n  </md-content>\n</md-sidenav>";
        };
      },
      link: function($scope, elem, attrs, ctrl) {
        var __constructor;
        __constructor = function() {
          var defaultFilters;
          $scope.resourceUrl = attrs.resourceUrl;
          $scope.fieldName = attrs.fieldName;
          $scope.fieldStreet = attrs.fieldStreet;
          $scope.fieldZip = attrs.fieldZip;
          $scope.fieldCity = attrs.fieldCity;
          $scope.initialFilters = attrs.initialFilters;
          $scope.maxResults = attrs.maxResults;
          $scope.initialZoom = attrs.initialZoom;
          $scope.maxZoom = attrs.maxZoom;
          $scope.fallbackCenter = attrs.fallbackCenter;
          $scope.fallbackImage = attrs.fallbackImage;
          $scope.mapStyle = attrs.mapStyle;
          $scope.alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
          $scope.initialFilters = $scope.initialFilters.replace(/ +(?= )/g, "").split(" ");
          $scope.maxResults = $scope.maxResults || 5;
          $scope.initialZoom = $scope.initialZoom || 8;
          $scope.radius = $scope.initialRadius || 0;
          $scope.search = "";
          $scope.results = [];
          $scope.markers = [];
          $scope.places = [];
          $scope.modalPlace = false;
          $scope.cardOrder = null;
          $scope.availableFilters = null;
          $scope.availableRadii = [1, 2, 5, 10, 25, 50, 100];
          $scope.fields = [];
          $scope.addressFields = {
            name: $scope.fieldName,
            street: $scope.fieldStreet,
            zip: $scope.fieldZip,
            city: $scope.fieldCity
          };
          defaultFilters = [$scope.addressFields.city, $scope.addressFields.zip, $scope.addressFields.name];
          $scope.defaultFilters = $scope.initialFilters || defaultFilters;
          $scope.geocoder = new google.maps.Geocoder;
          elem.html(ctrl.getTemplate());
          $compile(elem.contents())($scope);
          $scope.renderMap();
          $scope.getUserPosition();
          $scope.getDefaultLatLon();
          return ctrl.getData();
        };
        $scope.getUserPosition = ctrl.getUserPosition;
        $scope.geoSuccessHandler = ctrl.geoSuccessHandler;
        $scope.getDefaultLatLon = ctrl.getDefaultLatLon;
        $scope.openModal = ctrl.openModal;
        $scope.closeModal = ctrl.closeModal;
        $scope.shuffle = ctrl.shuffle;
        $scope.distance = ctrl.distance;
        $scope.clearMarkers = ctrl.clearMarkers;
        $scope.markerSymbol = ctrl.markerSymbol;
        $scope.markerLabel = ctrl.markerLabel;
        $scope.updateMap = ctrl.updateMap;
        $scope.renderMap = ctrl.renderMap;
        $scope.setInactive = ctrl.setInactive;
        $scope.toggleActive = ctrl.toggleActive;
        $scope.setActive = ctrl.setActive;
        $scope.showDirection = ctrl.showDirection;
        $scope.getFallbackResults = ctrl.getFallbackResults;
        $scope.filterPlaces = ctrl.filterPlaces;
        $scope.filterTerm = ctrl.filterTerm;
        $scope.filterNearby = ctrl.filterNearby;
        $scope.getNearby = ctrl.getNearby;
        return __constructor();
      }
    };
  };

  angular.module("nickel.locationSearch", []).directive("locationSearch", LocationSearch);

}).call(this);
