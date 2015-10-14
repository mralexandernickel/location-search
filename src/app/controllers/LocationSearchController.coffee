LocationSearchController = ($scope, $http, $filter) ->
  __construct = ->
    getData()
    navigator.geolocation.getCurrentPosition geoSuccessHandler

  $scope.maxResults = 5
  $scope.initialZoom = 8
  $scope.results = []
  $scope.markers = []
  $scope.places = []

  # Gets triggered on input-change
  $scope.filterPlaces = ->
    fields = ["Hauptkanzlei_Ort","Hauptkanzlei_PLZ","Name"]
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

  clearMarkers = ->
    for marker in $scope.markers
      marker.setMap null
    $scope.markers = []

  updateMap = ->
    if $scope.results.length > 0
      bounds = new google.maps.LatLngBounds
      geocoder = new google.maps.Geocoder
      clearMarkers()
      # add markers
      for place in $scope.results
        data =
          address: "#{place.Hauptkanzlei_Strasse} #{place.Hauptkanzlei_PLZ} #{place.Hauptkanzlei_Ort}"
        geocoder.geocode data, ((results, status) ->
          location = results[0].geometry.location
          bounds.extend new google.maps.LatLng location.lat(), location.lng()
          $scope.map.fitBounds bounds
          $scope.map.setCenter bounds.getCenter()
          marker = new google.maps.Marker
            map: $scope.map
            position: location
          $scope.markers.push marker
        ).bind(place)
    else
      clearMarkers()
      $scope.map.setZoom $scope.initialZoom
      $scope.map.setCenter $scope.initialCenter

  # get geolocation of user
  geoSuccessHandler = (position) ->
    $scope.initialCenter = new google.maps.LatLng position.coords.latitude, position.coords.longitude
    renderMap()
  
  # render map for the first time
  renderMap = ->
    mapOptions =
      zoom: $scope.initialZoom
      scrollwheel: false
      disableDefaultUI: true
      center: $scope.initialCenter
    $scope.map = new google.maps.Map document.getElementById("gmapSearchContainer"), mapOptions

  # get the data
  getData = ->
    $http
      .get "data/mitglieder.json"
      .success (d) ->
        $scope.places = d

  __construct()

app.controller "LocationSearchController", LocationSearchController
