An Angular-Directive for a Fullscreen Location-Search
=====================================================

Ever needed a Fullscreen Location-Search using Google-Maps? Here is a Directive for that ;-)

SUPER-easy to setup and completely flexible. Give the Directive the URL to your JSON-Array of Place-Objects,
set a fallback-map-center (used if the user denies the geolocation-request), map some Fields, and you're done!

Have Fun!  


## Install

The easiest way is to install via bower:

    bower install location-search


## How to use

Load Google-Maps APIv3 and this Module inside your DOM, set this Module as dependency in your AngularJS-App, and you're ready to go:

    <location-search
      layout="row"
      flex
      resource-url="data/salons.json"
      field-name="name"
      field-street="address"
      field-zip="zip"
      field-city="city"
      max-results="5"
      initial-zoom="8"
      initial-filters="name zip city"></location-search>

The attributes "resource-url", "field-name", "field-street" and "field-city" are obligatory.
The attributes "max-results", "initial-zoom" and "initial-filters" are optional, and have the values shown above as defaults.
