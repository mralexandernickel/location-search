LocationSearch = ($http, $filter, $mdSidenav) ->
  directive =
    restrict: "E"
    scope:
      resourceUrl: "@resourceUrl"
      fieldName: "@fieldName"
      fieldStreet: "@fieldStreet"
      fieldZip: "@fieldZip"
      fieldCity: "@fieldCity"
      initialFilters: "@initialFilters"
      maxResults: "@maxResults"
      initialZoom: "@initialZoom"
    
    link: ($scope, elem, attrs) ->
      __construct = ->
        setVariables()
        getData()

      #
      # set and format needed attributes
      #
      setVariables = ->
        navigator.geolocation.getCurrentPosition geoSuccessHandler
        $scope.initialFilters = $scope.initialFilters.replace(/ +(?= )/g, "").split(" ")
        $scope.maxResults = $scope.maxResults or 5
        $scope.initialZoom = $scope.initialZoom or 8
        $scope.results = []
        $scope.markers = []
        $scope.places = []

        $scope.availableFilters = null

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

      #
      # Gets triggered on input-change
      #
      $scope.filterPlaces = (field) ->
        activeFields = $scope.fields.filter (item) -> item.checked
        fields = []
        for activeField in activeFields
          fields.push activeField.label
        if $scope.search.length < 2
          $scope.results = []
        else
          filterArgs = (item) ->
            result = false
            chunks = $scope.search.split " "
            for chunk in chunks
              for property in fields
                if item[property]
                  if item[property].toLowerCase().indexOf(chunk.toLowerCase()) >= 0
                    result = true
            return result
          result = $filter("filter")($scope.places, filterArgs)
          $scope.results = shuffle result
        updateMap()

      #
      # Shuffle Results using Fisher-Yates shuffle algorithm and return just the first n items
      # 
      # @link http://stackoverflow.com/questions/2450954/how-to-randomize-shuffle-a-javascript-array
      #
      shuffle = (array) ->
        i = array.length - 1
        while i > 0
          j = Math.floor(Math.random() * (i + 1))
          temp = array[i]
          array[i] = array[j]
          array[j] = temp
          i--
        array.slice 0, $scope.maxResults

      #
      # remove markers from map
      #
      clearMarkers = ->
        for marker in $scope.markers
          marker.setMap null
        $scope.markers = []

      #
      # update map and add markers
      #
      updateMap = ->
        if $scope.results.length > 0
          bounds = new google.maps.LatLngBounds
          geocoder = new google.maps.Geocoder
          clearMarkers()
          # add markers
          for place in $scope.results
            data =
              address: "#{place[$scope.addressFields.street]} #{place[$scope.addressFields.zip]} #{place[$scope.addressFields.city]}"
            ((item) ->
              geocoder.geocode data, (results, status) ->
                location = results[0].geometry.location
                bounds.extend new google.maps.LatLng location.lat(), location.lng()
                $scope.map.fitBounds bounds
                $scope.map.setCenter bounds.getCenter()
                marker = new google.maps.Marker
                  map: $scope.map
                  position: location
                item.marker = marker
                marker.addListener "click", ->
                  for m in $scope.markers
                    m.setAnimation null
                  for i in $scope.results
                    i.active = false
                  item.active = true
                  @setAnimation google.maps.Animation.BOUNCE
                  $scope.$apply()
                $scope.markers.push marker
            )(place)
        else
          clearMarkers()
          $scope.map.setZoom $scope.initialZoom
          $scope.map.setCenter $scope.initialCenter

      $scope.cardOrder = null

      $scope.setInactive = (place) -> place.active = false

      $scope.setActive = (place) ->
        for marker in $scope.markers
          marker.setAnimation null
        for i in $scope.places
          i.active = false
        place.active = true
        place.marker.setAnimation google.maps.Animation.BOUNCE

      # get geolocation of user
      geoSuccessHandler = (position) ->
        $scope.userLat = position.coords.latitude
        $scope.userLong = position.coords.longitude
        $scope.initialCenter = new google.maps.LatLng position.coords.latitude, position.coords.longitude
        renderMap()

      # calculate distance
      distance = (lat1, lon1, lat2, lon2, unit) ->
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
      
      # render map for the first time
      renderMap = ->
        mapOptions =
          zoom: $scope.initialZoom
          scrollwheel: false
          disableDefaultUI: true
          center: $scope.initialCenter
        $scope.map = new google.maps.Map document.getElementById("gmapSearchContainer"), mapOptions

      $scope.toggleSidenav = -> $mdSidenav("left").toggle()

      # get the data
      getData = ->
        $http
          .get $scope.resourceUrl
          .success (d) ->
            for key,value of d[0]
              $scope.fields.push
                label: key
                checked: if $scope.defaultFilters.indexOf(key) >= 0  then true else false
            $scope.places = d

      __construct()

    template:
      """
      <md-sidenav class="md-sidenav-left md-whiteframe-z2 sidenav-filter" md-component-id="left">
          <md-tabs md-stretch-tabs="always" flex md-align-tabs="bottom">
            <md-tab>
              <md-tab-label>
              <span><md-icon md-font-icon="mdi-magnify" class="mdi"></md-icon></span>
              </md-tab-label>
              <md-tab-body>
                <md-content class="md-padding">
                  <h2>First Tab</h2>
                </md-content>
              </md-tab-body>
            </md-tab>
            <md-tab>
              <md-tab-label>
              <span><md-icon md-font-icon="mdi-filter-variant" class="mdi"></md-icon></span>
              </md-tab-label>
              <md-tab-body>
                <md-content class="md-padding">
                  <md-switch class="md-primary" ng-repeat="field in fields"
                             ng-model="field.checked"
                             aria-label="{{field.label}}">{{field.label}}</md-switch>
                </md-content>
              </md-tab-body>
            </md-tab>
          </md-tabs>
      </md-sidenav>
      <md-content flex layout-padding>
        <md-button class="md-icon-button" ng-click="toggleSidenav()">
          <md-icon class="mdi" md-font-icon="mdi-menu"></md-icon>
        </md-button>
        <input id="gmapSearch" type="text" ng-model="search" ng-model-options="{debounce: 700}" ng-change="filterPlaces()" placeholder="Search...">
        <div id="gmapSearchContainer"></div>
      </md-content>
      <md-sidenav class="md-sidenav-right md-whiteframe-z2" md-component-id="right" md-is-locked-open="results.length > 0">
        <md-content layout-padding>
          <md-card ng-repeat="place in results | orderBy: cardOrder"
                   ng-click="setActive(place)"
                   ng-class="{active: place.active}">
            <md-card-content>
              <md-button class="md-raised" ng-if="place.active" ng-click="setInactive(place)">Close</md-button>
              <h2 class="md-title">{{place[addressFields.name]}}</h2>
              <p class="md-body-1">{{place[addressFields.street]}}<br>
              {{place[addressFields.zip]}} {{place[addressFields.city]}}</p>
            <md-card-content>
          </md-card>
        </md-content>
      </md-sidenav>
      """

app.directive "locationSearch", LocationSearch
