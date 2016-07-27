Extendable Location-Search
==========================

An Angular Directive to easily generate location-search. The complete Application
is working inside the Client (including distance-calculation).

If you enter something inside the searchform, the application will first loop
through the given data. If there are no matches, we try to geocode the given
searchterm using Google maps Geocoder, and then search for entries in data
nearby the geocoded searchterm. This way we are able to show entries
near "La Tour Eifel", or even "eifleturm" (Yes...the typo is wanted).


## Install

The easiest way is to install via bower:

    bower install nickel.locationSearch


## How to use

Load Google-Maps APIv3 and this Module inside your DOM, set this Module as dependency in your AngularJS-App, and you're ready to go.


## Data

Just give an array with objects containing latitude and longitude and optional
fields you want to search for. Could for example look like

    [
      {
        "latitude": 49.000012,
        "longitude": 8.12323524,
        "name": "Example Name",
        "services": [
          "Autoreparatur",
          "Audio Tuning"
        ],
        "anything": "as dasd asd asd asd ad asd as dasd ad"
      },
      ...
    ]


## Customize

The directive is easily customizable, you create an own angular directive that
just needs to require this locationSearch-directive.


### Behaviour

You can easily extend or change the behaviour of the directive, by simply
overwriting methods of the controller. To make our methods accessible from the
view, we are referencing the controller-methods to the $scope inside our
link-function.

An example with just another getData-method using hardcoded locations could look
like this:

    ExtendedLocationsearch = function() {
      restrict: "E",
      priority: 1,
      require: "locationSearch",
      link: function($scope, elem, attr, ctrl) {
        ctrl.getData = function() {
          $scope.places = []
          $scope.updateMap()
        }
      }
    }

    angular
      .module("demo", ["nickel.locationSearch"])
      .directive("extendedLocationsearch", ExtendedLocationsearch)

If you have done this, you would use your new directive inside the view like this:

    <extended-locationsearch
      field-name="name"
      field-street="address"
      field-zip="zip"
      field-city="city"
      fallback-center="Eifelturm"
      map-style="style3"
      max-results="5"
      initial-filters="name zip address city">
    </extended-locationsearch>


### Markup

If you would like to change the markup of the directive, you just need to
overwrite the directives controller's getTemplate-method. The only thing you
really need is a container with a fixed id for the google-map itself, the id
needs to be `gmapSearchContainer`. A really minimal template with just the map
and a searchform to filter the results could look like this:

    ExtendedLocationsearch = function() {
      restrict: "E",
      priority: 1,
      require: "locationSearch",
      link: function($scope, elem, attr, ctrl) {
        ctrl.getTemplate = function() {
          return \`
            <input
              type="text"
              ng-model="search"
              ng-model-options="{debounce: 700}"
              ng-change="filterPlaces()"
              placeholder="Search">
            <div
              id="gmapSearchContainer"
              style="height:600;width:600;"></div>
            \`;
        }
      }
    }

    angular
      .module("demo", ["nickel.locationSearch"])
      .directive("extendedLocationsearch", ExtendedLocationsearch)


### Map Styling

It is also possible to change the Style of the google-map itself. To use this
feature you just need to add a `window.gmapStyles` object before you boot your
angular-app (or just set it before you include angular.js), and register
your templates there.

    window.gmapStyles = {
      "yourGreatMapStyle": [
        {
          'featureType': 'water'
          'elementType': 'geometry'
          'stylers': [
            { 'color': '#e9e9e9' }
            { 'lightness': 17 }
          ]
        }
      ]
    }

You can then use the keys you used, inside the map-styles
attribute of your html-element.

    <location-search
      field-name="name"
      field-street="address"
      field-zip="zip"
      field-city="city"
      fallback-center="Eifelturm"
      map-style="yourGreatMapStyle"
      max-results="5"
      initial-filters="name zip address city">
    </location-search>

There is a great web-application with predefined google-map styles you could
use, called [snazzymaps]([https://snazzymaps.com/).
