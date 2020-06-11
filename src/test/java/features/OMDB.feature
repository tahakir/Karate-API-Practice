@omdb
Feature: OMDB API Test

  Background: Setup
    * url 'http://www.omdbapi.com'

    Scenario: Verify that API key is required
      Given param t = 'Dark Knight'
      When method get
      Then status 401
      And assert response.Error == 'No API key provided.'
      * print karate.pretty(response)
      
      
      Scenario: Verify movie info
        Given param t = 'The Patriot'
        And param apiKey = '9f94d4d0'
        When method get
        * print response
        Then status 200
        And match response contains {Title: "The Patriot"}


