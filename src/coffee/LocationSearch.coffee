#
# Styles for the Google Map
#
# @see https://snazzymaps.com/
#
if !gmapStyles then gmapStyles = {}

gmapStyles.style1 = [
  {
    'featureType': 'water'
    'elementType': 'geometry'
    'stylers': [
      { 'color': '#e9e9e9' }
      { 'lightness': 17 }
    ]
  }
  {
    'featureType': 'landscape'
    'elementType': 'geometry'
    'stylers': [
      { 'color': '#f5f5f5' }
      { 'lightness': 20 }
    ]
  }
  {
    'featureType': 'road.highway'
    'elementType': 'geometry.fill'
    'stylers': [
      { 'color': '#ffffff' }
      { 'lightness': 17 }
    ]
  }
  {
    'featureType': 'road.highway'
    'elementType': 'geometry.stroke'
    'stylers': [
      { 'color': '#ffffff' }
      { 'lightness': 29 }
      { 'weight': 0.2 }
    ]
  }
  {
    'featureType': 'road.arterial'
    'elementType': 'geometry'
    'stylers': [
      { 'color': '#ffffff' }
      { 'lightness': 18 }
    ]
  }
  {
    'featureType': 'road.local'
    'elementType': 'geometry'
    'stylers': [
      { 'color': '#ffffff' }
      { 'lightness': 16 }
    ]
  }
  {
    'featureType': 'poi'
    'elementType': 'geometry'
    'stylers': [
      { 'color': '#f5f5f5' }
      { 'lightness': 21 }
    ]
  }
  {
    'featureType': 'poi.park'
    'elementType': 'geometry'
    'stylers': [
      { 'color': '#dedede' }
      { 'lightness': 21 }
    ]
  }
  {
    'elementType': 'labels.text.stroke'
    'stylers': [
      { 'visibility': 'on' }
      { 'color': '#ffffff' }
      { 'lightness': 16 }
    ]
  }
  {
    'elementType': 'labels.text.fill'
    'stylers': [
      { 'saturation': 36 }
      { 'color': '#333333' }
      { 'lightness': 40 }
    ]
  }
  {
    'elementType': 'labels.icon'
    'stylers': [ { 'visibility': 'off' } ]
  }
  {
    'featureType': 'transit'
    'elementType': 'geometry'
    'stylers': [
      { 'color': '#f2f2f2' }
      { 'lightness': 19 }
    ]
  }
  {
    'featureType': 'administrative'
    'elementType': 'geometry.fill'
    'stylers': [
      { 'color': '#fefefe' }
      { 'lightness': 20 }
    ]
  }
  {
    'featureType': 'administrative'
    'elementType': 'geometry.stroke'
    'stylers': [
      { 'color': '#fefefe' }
      { 'lightness': 17 }
      { 'weight': 1.2 }
    ]
  }
]

gmapStyles.style2 = [
  {
    'featureType': 'administrative'
    'elementType': 'labels.text.fill'
    'stylers': [ { 'color': '#444444' } ]
  }
  {
    'featureType': 'administrative.country'
    'elementType': 'geometry.fill'
    'stylers': [ { 'visibility': 'on' } ]
  }
  {
    'featureType': 'administrative.province'
    'elementType': 'labels.icon'
    'stylers': [
      { 'hue': '#ff0000' }
      { 'visibility': 'on' }
    ]
  }
  {
    'featureType': 'landscape'
    'elementType': 'all'
    'stylers': [ { 'color': '#f2f2f2' } ]
  }
  {
    'featureType': 'poi'
    'elementType': 'all'
    'stylers': [ { 'visibility': 'off' } ]
  }
  {
    'featureType': 'road'
    'elementType': 'all'
    'stylers': [
      { 'saturation': -100 }
      { 'lightness': 45 }
    ]
  }
  {
    'featureType': 'road.highway'
    'elementType': 'all'
    'stylers': [ { 'visibility': 'simplified' } ]
  }
  {
    'featureType': 'road.arterial'
    'elementType': 'labels.icon'
    'stylers': [ { 'visibility': 'off' } ]
  }
  {
    'featureType': 'transit'
    'elementType': 'all'
    'stylers': [ { 'visibility': 'off' } ]
  }
  {
    'featureType': 'water'
    'elementType': 'all'
    'stylers': [
      { 'color': '#46bcec' }
      { 'visibility': 'on' }
    ]
  }
]

gmapStyles.style3 = [
  {
    'featureType': 'administrative'
    'elementType': 'labels.text.fill'
    'stylers': [ { 'color': '#999999' } ]
  }
  {
    'featureType': 'administrative.country'
    'elementType': 'geometry.fill'
    'stylers': [ { 'visibility': 'on' } ]
  }
  {
    'featureType': 'administrative.province'
    'elementType': 'labels.icon'
    'stylers': [
      { 'hue': '#fcb034' }
      { 'visibility': 'on' }
    ]
  }
  {
    'featureType': 'landscape'
    'elementType': 'all'
    'stylers': [ { 'color': '#f4f4f4' } ]
  }
  {
    'featureType': 'poi'
    'elementType': 'all'
    'stylers': [ { 'visibility': 'off' } ]
  }
  {
    'featureType': 'road'
    'elementType': 'all'
    'stylers': [
      { 'saturation': -100 }
      { 'lightness': 45 }
    ]
  }
  {
    'featureType': 'road.highway'
    'elementType': 'all'
    'stylers': [ { 'visibility': 'simplified' } ]
  }
  {
    'featureType': 'road.arterial'
    'elementType': 'labels.icon'
    'stylers': [ { 'visibility': 'off' } ]
  }
  {
    'featureType': 'transit'
    'elementType': 'all'
    'stylers': [ { 'visibility': 'off' } ]
  }
  {
    'featureType': 'water'
    'elementType': 'all'
    'stylers': [
      { 'color': '#1b99d6' }
      { 'visibility': 'on' }
    ]
  }
]

#
# Definition of Marker Styles
#
markerStyle_1 = "M12,11.5A2.5,2.5 0 0,1 9.5,9A2.5,2.5 0 0,1 12,6.5A2.5,2.5 0 0,1 14.5,9A2.5,2.5 0 0,1 12,11.5M12,2A7,7 0 0,0 5,9C5,14.25 12,22 12,22C12,22 19,14.25 19,9A7,7 0 0,0 12,2Z"

markerStyle_2 = "M 12,2 C 8.3348086,2 5,5.3348086 5,9 c 0,5.25 7,13 7,13 0,0 7,-7.75 7,-13 0,-3.6651914 -3.334809,-7 -7,-7 z"

#
# Definition of Angular Directive
#
# ====
# TODO Add private Properties to controller
# TODO Allow overwriting of more methods by adding them to controller
#      and reference them in $scope
# TODO Allow switch of Map Styles
# ===
# TODO Make available Map Styles easily extendable (put into separate file)
# TODO Add attribute to define latitude & longitude fields
# TODO Implement ranking by sorting by one boolean field (place.isPremium or something)
# TODO Add binary to geocode a set of locations
# TODO make marker labels configurable
# TODO Attribute switch for fallbackResults
#
LocationSearch = ($http, $filter, $compile) ->

  directive =
    restrict: "EA"
    priority: 2

    controller: ($scope, $filter) ->

      #
      # get the users position
      #
      this.getUserPosition = ->
        navigator.geolocation.getCurrentPosition $scope.geoSuccessHandler, $scope.getDefaultLatLon

      #
      # get geolocation of user
      #
      this.geoSuccessHandler = (position) ->
        $scope.userLat = position.coords.latitude
        $scope.userLon = position.coords.longitude
        $scope.initialCenter = new google.maps.LatLng position.coords.latitude, position.coords.longitude
        $scope.$apply()
        #$scope.renderMap()
        $scope.map.panTo $scope.initialCenter

      #
      # get fallback initialCenter if user doesn't allow getting his position
      #
      this.getDefaultLatLon = (err) ->
        data = address: $scope.fallbackCenter
        $scope.geocoder.geocode data, (results, status) ->
          location = results[0].geometry.location
          $scope.initialCenter = new google.maps.LatLng location.lat(), location.lng()
          #$scope.renderMap()
          $scope.map.panTo $scope.initialCenter

      #
      # Open Modal with Detail Information
      #
      this.openModal = (index) ->
        place = $scope.results[index]
        console.info place
        $scope.modalPlace = place

      #
      #
      #
      this.closeModal = ->
        $scope.modalPlace = false

      #
      # Shuffle Results using Fisher-Yates shuffle algorithm and return just the first n items
      #
      # @link http://stackoverflow.com/questions/2450954/how-to-randomize-shuffle-a-javascript-array
      #
      this.shuffle = (array, maxResults = $scope.maxResults) ->
        # TODO if filerNearby we need the nearest results
        i = array.length - 1
        while i > 0
          j = Math.floor(Math.random() * (i + 1))
          temp = array[i]
          array[i] = array[j]
          array[j] = temp
          i--
        shuffled = array.slice 0, maxResults
        $filter("orderBy")(shuffled, "distance")

      #
      # calculate distance
      #
      this.distance = (lat1, lon1, lat2, lon2, unit) ->
        radlat1 = Math.PI * lat1 / 180
        radlat2 = Math.PI * lat2 / 180
        theta = lon1 - lon2
        radtheta = Math.PI * theta / 180
        dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta)
        dist = Math.acos(dist)
        dist = dist * 180 / Math.PI
        dist = dist * 60 * 1.1515
        if unit == "K"
          dist = dist * 1.609344
        if unit == "N"
          dist = dist * 0.8684
        return dist

      #
      # remove markers from map
      #
      this.clearMarkers = ->
        for marker in $scope.markers
          marker.setMap null
        $scope.markers = []

      #
      # Helper Method to generate marker symbols
      #
      this.markerSymbol = (color = "#000", strokeColor = "#fff", scale = 1.9, strokeWeight = 2) ->
        symbol =
          path: markerStyle_2
          fillColor: color
          fillOpacity: 1
          strokeColor: strokeColor
          strokeWeight: strokeWeight
          scale: scale
          anchor: new google.maps.Point 11.7, 22
          labelOrigin: new google.maps.Point 12, 10
        return symbol

      #
      # Helper Method to generate marker labels
      #
      this.markerLabel = (text, color = "#ffffff", size = "16px", weight = "800") ->
        label =
          color: color
          fontSize: size
          fontWeight: weight
          text: text
        return label

      #
      # update map and add markers
      #
      this.updateMap = ->
        if $scope.results.length
          bounds = new google.maps.LatLngBounds
          #geocoder = new google.maps.Geocoder
          $scope.clearMarkers()
          # add markers
          for place,index in $scope.results
            ((item) ->
              position = new google.maps.LatLng place.lat, place.lon
              bounds.extend position
              $scope.map.fitBounds bounds

              marker = new google.maps.Marker
                map: $scope.map
                position: position
                icon: $scope.markerSymbol()
                label: $scope.markerLabel($scope.alphabet[index])

              place.marker = marker

              marker.addListener "click", ->
                $scope.toggleActive item
                $scope.$apply()
              $scope.markers.push marker

              # set new map-center if all markers are placed
              if index is $scope.results.length-1
                #
                # ATTENTION!
                # needs to be panTo() instead of setCenter() as otherwise the markers will disappear sometimes!
                # IT'S A KNWON BUG IN GMAPS-JS-API
                #
                # @see https://code.google.com/p/gmaps-api-issues/issues/detail?id=5716&q=apitype%3AJavascript3%20type%3ADefect&sort=-stars&colspec=ID%20Type%20Status%20Introduced%20Fixed%20Summary%20Internal%20Stars
                #
                #$scope.map.setCenter bounds.getCenter()
                $scope.mapCenter = bounds.getCenter()
                $scope.map.panTo $scope.mapCenter
            )(place)
        else
          $scope.clearMarkers()
          $scope.map.setZoom $scope.initialZoom
          #$scope.map.setCenter $scope.initialCenter
          $scope.map.panTo $scope.initialCenter

      #
      # render map for the first time
      #
      this.renderMap = ->
        mapOptions =
          maxZoom: $scope.maxZoom
          zoom: $scope.initialZoom
          scrollwheel: false
          disableDefaultUI: true
          #center: $scope.initialCenter
        if $scope.mapStyle
          mapOptions.styles = gmapStyles[$scope.mapStyle]
        $scope.map = new google.maps.Map document.getElementById("gmapSearchContainer"), mapOptions
        # MAYBE THIS IS USEFUL LATER...
        google.maps.event.addListenerOnce $scope.map, "idle", -> console.info "MAP IS READY"

      #
      #
      #
      this.setInactive = (place) ->
        place.marker.setIcon $scope.markerSymbol()
        place.active = false

      #
      #
      #
      this.toggleActive = (place) ->
        if place.active then $scope.setInactive(place) else $scope.setActive(place)

      #
      #
      #
      this.setActive = (place) ->
        for marker in $scope.markers
          marker.setIcon $scope.markerSymbol()
        for i in $scope.places
          i.active = false
        place.active = true
        place.marker.setIcon $scope.markerSymbol("#c4301a")

      #
      #
      #
      this.showDirection = (place,event) ->
        event.stopPropagation()
        url = "https://www.google.com/maps/dir/#{$scope.userLat},#{$scope.userLon}/#{place.lat},#{place.lon}/"
        win = window.open url, "_blank"
        win.focus()

      #
      #
      #
      this.getFallbackResults = ->
        $scope.results = $scope.shuffle $scope.places

      #
      # Gets triggered on input-change
      #
      # TODO needs refactoring as its grown ugly!!!
      #
      this.filterPlaces = ->
        maxDistance = 10
        if $scope.search.length < 2 and $scope.radius <= 0
          $scope.getFallbackResults()
          $scope.updateMap()
        else
          result = $scope.filterTerm($scope.places)
          console.log "RESULT length", result.length
          if $scope.radius > 0
            if !result.length
              console.info "BLAAAAAAAAA"
              $scope.getNearby()
            else
              $scope.geocoder.geocode {address: $scope.search}, (results) ->
                location = results[0].geometry.location
                result = $scope.filterNearby result, location
                while !result.length < $scope.maxResults and maxDistance <= 1000
                  maxDistance += maxDistance
                  result = $scope.filterNearby $scope.places, location, maxDistance
                $scope.results = result
                $scope.$apply()
                $scope.updateMap()
          else
            if !result.length
              console.info "nothing found in dataset, try to geocode and get nearby"
              $scope.geocoder.geocode {address: $scope.search}, (results) ->
                location = results[0].geometry.location
                result = $scope.filterNearby $scope.places, location, maxDistance
                while !result.length < $scope.maxResults and maxDistance <= 1000
                  maxDistance += maxDistance
                  result = $scope.filterNearby $scope.places, location, maxDistance
                #$scope.results = $scope.shuffle result
                $scope.results = result
                $scope.$apply()
                $scope.updateMap()
            else
              $scope.results = $scope.shuffle result
              $scope.updateMap()

      #
      #
      #
      this.filterNearby = (places, location = false, maxDistance = $scope.radius, maxResults = $scope.maxResults) ->
        if location
          sourceLat = location.lat()
          sourceLon = location.lng()
        else
          sourceLat = $scope.userLat
          sourceLon = $scope.userLon
        #sourceLat = $scope.initialCenter.lat()
        #sourceLat = $scope.initialCenter.lng()

        filterByDistance = (item, index) ->
          item.distance = $scope.distance(sourceLat, sourceLon, item.lat, item.lon, "K")
          return item.distance <= maxDistance
        result = $filter("filter")(places, filterByDistance)
        ordered = $filter("orderBy")(result, "distance")
        return ordered.slice 0, maxResults

      #
      #
      #
      this.getNearby = ->
        places = $scope.places

        if $scope.search.length
          $scope.geocoder.geocode {address: $scope.search}, (results) ->
            location = results[0].geometry.location
            result = $scope.filterNearby places, location
            $scope.results = result
            $scope.updateMap()
            $scope.$apply()
        else
          result = $scope.filterNearby places
          maxDistance = 10
          while !result.length < $scope.maxResults and maxDistance <= 1000
            maxDistance += maxDistance
            result = $scope.filterNearby places, false, maxDistance
          $scope.results = result
          $scope.updateMap()

      #
      #
      #
      this.filterTerm = (places) ->
        activeFields = $scope.fields.filter (item) -> item.checked
        fields = []
        for activeField in activeFields
          fields.push activeField.label
        filterByTerm = (item, index) ->
          result = false
          # calculate distance if the user allowed us to
          if $scope.userLat
            item.distance = $scope.distance($scope.userLat, $scope.userLon, item.lat, item.lon, "K")
          chunks = $scope.search.split " "
          results = []
          for chunk in chunks
            chunkFound = false
            for property in fields
              if item[property]
                if item[property].toLowerCase().indexOf(chunk.toLowerCase()) >= 0
                  #result = true
                  chunkFound = true
            results.push chunkFound
          #return result
          return results.every (item) -> item
        result = $filter("filter")(places, filterByTerm)
        $filter("orderBy")(result, "distance")

      #
      #
      #
      this.getData = ->
        console.info "IN PARENT"
        $http
          .get $scope.resourceUrl
          .success (d) ->
            for key,value of d[0]
              $scope.fields.push
                label: key
                checked: if $scope.defaultFilters.indexOf(key) >= 0  then true else false
            $scope.places = d
            $scope.getFallbackResults()
            $scope.updateMap()

      this.getTemplate = ->
        """
        <md-sidenav class="md-sidenav-left md-whiteframe-z2 sidenav-filter" md-component-id="left">
          <md-tabs md-stretch-tabs="always" flex md-align-tabs="bottom">
            <md-tab>
              <md-tab-label>
                <span><md-icon md-font-icon="mdi-magnify" class="mdi"></md-icon></span>
              </md-tab-label>
              <md-tab-body>
                <md-content class="md-padding">
                  <h2 class="md-headline">Search Nearby</h2>
                  <p class="md-body-1" ng-if="!userLat">We need your Location to enable Nearby-Search</p>
                  <md-button ng-click="getUserPosition()" class="md-raised md-primary" ng-if="!userLat">Get Position</md-button>
                  <md-input-container class="md-block">
                    <label>Radius</label>
                    <md-select
                      ng-model="radius"
                      ng-value="radius"
                      ng-disabled="!userLat"
                      ng-change="getNearby()">
                      <md-option ng-repeat="availableRadius in availableRadii" value="{{availableRadius}}">{{availableRadius}}</md-option>
                    </md-select>
                  </md-input-container>
                </md-content>
              </md-tab-body>
            </md-tab>
            <md-tab>
              <md-tab-label>
                <span><md-icon md-font-icon="mdi-filter-variant" class="mdi"></md-icon></span>
              </md-tab-label>
              <md-tab-body>
                <md-content class="md-padding">
                  <md-switch
                    class="md-primary" ng-repeat="field in fields"
                    ng-model="field.checked"
                    aria-label="{{field.label}}">{{field.label}}</md-switch>
                </md-content>
              </md-tab-body>
            </md-tab>
          </md-tabs>
        </md-sidenav>
        <md-content flex layout-padding>
          <md-button class="md-icon-button toggleSidenav" ng-click="toggleSidenav()">
            <md-icon class="mdi" md-font-icon="mdi-settings"></md-icon>
          </md-button>
          <md-button class="md-icon-button getPosition" ng-click="getUserPosition()">
            <md-icon class="mdi" md-font-icon="mdi-crosshairs-gps"></md-icon>
          </md-button>
          <input id="gmapSearch" type="text" ng-model="search" ng-model-options="{debounce: 700}" ng-change="filterPlaces()" placeholder="Search">
          <div id="gmapSearchContainer"></div>
        </md-content>
        <md-sidenav class="md-sidenav-right md-whiteframe-z2" md-component-id="right" md-is-locked-open="results.length > 0">
          <md-content layout-padding>
            <md-card
              ng-repeat="place in results | orderBy: cardOrder"
              ng-click="toggleActive(place)"
              ng-class="{active: place.active}">
              <md-card-content>
                <h2 class="md-title">{{place[addressFields.name]}}</h2>
                <p class="md-body-1">{{place[addressFields.street]}}<br>
                {{place[addressFields.zip]}} {{place[addressFields.city]}}</p>
              <md-card-content>
            </md-card>
          </md-content>
        </md-sidenav>
        """
      return


    link: ($scope, elem, attrs, ctrl) ->

      __constructor = ->
        $scope.resourceUrl = attrs.resourceUrl
        $scope.fieldName = attrs.fieldName
        $scope.fieldStreet = attrs.fieldStreet
        $scope.fieldZip = attrs.fieldZip
        $scope.fieldCity = attrs.fieldCity
        $scope.initialFilters = attrs.initialFilters
        $scope.maxResults = attrs.maxResults
        $scope.initialZoom = attrs.initialZoom
        $scope.maxZoom = attrs.maxZoom
        $scope.fallbackCenter = attrs.fallbackCenter
        $scope.fallbackImage = attrs.fallbackImage
        $scope.mapStyle = attrs.mapStyle

        $scope.alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        $scope.initialFilters = $scope.initialFilters.replace(/ +(?= )/g, "").split(" ")
        $scope.maxResults = $scope.maxResults or 5
        $scope.initialZoom = $scope.initialZoom or 8
        $scope.radius = $scope.initialRadius or 0
        $scope.search = ""
        $scope.results = []
        $scope.markers = []
        $scope.places = []

        $scope.modalPlace = false
        $scope.cardOrder = null
        $scope.availableFilters = null
        $scope.availableRadii = [1, 2, 5, 10, 25, 50, 100]
        #
        # COMMENTED OUT TO ALLOW WIDESPREAD SEARCHTERMS FOR THE MOMENT
        #
        #$scope.radius = $scope.availableRadii[2]

        $scope.fields = []

        $scope.addressFields =
          name: $scope.fieldName
          street: $scope.fieldStreet
          zip: $scope.fieldZip
          city: $scope.fieldCity

        defaultFilters = [
          $scope.addressFields.city,
          $scope.addressFields.zip,
          $scope.addressFields.name
        ]
        $scope.defaultFilters = $scope.initialFilters or defaultFilters
        $scope.geocoder = new google.maps.Geocoder

        elem.html ctrl.getTemplate()
        $compile(elem.contents())($scope)

        $scope.renderMap()
        $scope.getUserPosition()
        $scope.getDefaultLatLon()
        ctrl.getData()

      #
      # get the users position
      #
      $scope.getUserPosition = ctrl.getUserPosition

      #
      # get geolocation of user
      #
      $scope.geoSuccessHandler = ctrl.geoSuccessHandler

      #
      # get fallback initialCenter if user doesn't allow getting his position
      #
      $scope.getDefaultLatLon = ctrl.getDefaultLatLon

      #
      # Open Modal with Detail Information
      #
      $scope.openModal = ctrl.openModal

      #
      #
      #
      $scope.closeModal = ctrl.closeModal
      #
      # Shuffle Results using Fisher-Yates shuffle algorithm and return just the first n items
      #
      # @link http://stackoverflow.com/questions/2450954/how-to-randomize-shuffle-a-javascript-array
      #
      $scope.shuffle = ctrl.shuffle

      #
      # calculate distance
      #
      $scope.distance = ctrl.distance

      #
      # remove markers from map
      #
      $scope.clearMarkers = ctrl.clearMarkers

      #
      # Helper Method to generate marker symbols
      #
      $scope.markerSymbol = ctrl.markerSymbol

      #
      # Helper Method to generate marker labels
      #
      $scope.markerLabel = ctrl.markerLabel

      #
      # update map and add markers
      #
      $scope.updateMap = ctrl.updateMap

      #
      # render map for the first time
      #
      $scope.renderMap = ctrl.renderMap

      #
      #
      #
      $scope.setInactive = ctrl.setInactive

      #
      #
      #
      $scope.toggleActive = ctrl.toggleActive

      #
      #
      #
      $scope.setActive = ctrl.setActive

      #
      #
      #
      $scope.showDirection = ctrl.showDirection

      #
      #
      #
      $scope.getFallbackResults = ctrl.getFallbackResults

      #
      # Gets triggered on input-change
      #
      # TODO needs refactoring as its grown ugly!!!
      #
      $scope.filterPlaces = ctrl.filterPlaces

      #
      #
      #
      $scope.filterTerm = ctrl.filterTerm

      #
      #
      #
      $scope.filterNearby = ctrl.filterNearby

      #
      #
      #
      $scope.getNearby = ctrl.getNearby

      __constructor()


angular
  .module "nickel.locationSearch", []
  .directive "locationSearch", LocationSearch
