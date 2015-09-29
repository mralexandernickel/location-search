ApplicationController = ($scope,$mdSidenav) ->
  __construct = ->
    console.log "application running"

  $scope.toggleSidenav = (menuId) ->
    $mdSidenav(menuId).toggle()

  __construct()

app.controller "ApplicationController", ApplicationController
