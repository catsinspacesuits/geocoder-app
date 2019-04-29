# Geocoder App

To start geocoding you must first sign up. This is quick and no email confirmation is required. Following this, users are able to pass an address or place name as a string into the search field and the latitude and longitude will be returned.

The app uses the LocationIQ API to return the coordinates in JSON format. If the LocationIQ API cannot find the place the users searched for, an error message will be raised asking the user to try again. If the user enters a blank input a different error message will be raised, asking them to fill in the search field.

You can find a live version of the app [here](https://geocoder-app.herokuapp.com)

Ruby version 2.6.0 and Rails version 5.2.3 are used.


