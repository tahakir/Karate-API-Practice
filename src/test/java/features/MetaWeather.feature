@meta_weather

Feature: MetaWeather API Tests

  Background: Setup Base URL
    * url 'https://www.metaweather.com/api/'

  Scenario: Search for Istanbul
    Given path 'location/search'
    And  param query = 'Istanbul'
    When method get
    Then status 200
    And match response[0] contains {title: 'Istanbul'}
    * print karate.pretty(response)

  Scenario Outline: Verify that cities <query> exist
    Given path '/location/search'
    And param query = '<query>'
    When method get
    Then status 200
    And match each response contains {title: '<query>'}
    * print karate.pretty(response)

    Examples: cities
      | query      |
      | London     |
      | Manchester |
      | Berlin     |
      | Roma       |
      | Ankara     |