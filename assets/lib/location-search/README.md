location-search
===============


## How to use

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
The attributes "max-results", "initial-zoom" and "initial-filters" are optiobnal, and have the values shown above as defaults.
