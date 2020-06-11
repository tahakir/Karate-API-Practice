@bookit
Feature: Book-it API Tests

  Background: Setup
    * url 'https://cybertek-reservation-api-qa.herokuapp.com/'
    * path 'sign'
    * param email = 'teacherva5@gmail.com'
    * param password = 'maxpayne'
    * method get
    * def token = response.accessToken
    * print "Token: ", token
    
    Scenario: Get All Rooms
      
      Given path 'api/rooms'
      * header Authorization = token
      When method get
      Then status 200
      * print karate.pretty(response)