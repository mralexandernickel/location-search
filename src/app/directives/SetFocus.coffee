app.directive "setFocus", ->
  directive =
    scope:
      setFocus: "="
    link: (scope, element) ->
      if scope.setFocus
        console.log element[0]
        element[0].focus()
