@zippopotam
Feature: Zippopotam API Test


  Background: Setup
    * url 'http://api.zippopotam.us'
    * header Accept = 'application/json'

  Scenario: Search for Beverly Hills

    Given path 'us/90210'
    When method get
    Then status 200
    And match header Content-Type == 'application/json'
    And match response.country == 'United States'
    And match response.places[0].['place name'] == 'Beverly Hills'
    And match response.places[0].['state abbreviation'] == 'CA'
    And  match response.['post code'] == '90210'

    * print karate.pretty(response)


  Scenario Outline: Search for <city>

    Given path '/us/<zip_code>'
    When method get
    Then status 200
    And match header Content-Type == 'application/json'
    And match response.country == 'United States'
    And match response.places[0].['place name'] == '<city>'
    And match response.places[0].['state abbreviation'] == '<state_abbreviation>'
    And match response.['post code'] == '<zip_code>'
    And match response.['country'] == '<country>'
    And print karate.pretty(response)


    Examples: test data
      | city          | zip_code | state_abbreviation | country       |
      | Kennesaw      | 30144    | GA                 | United States |
      | Alpharetta    | 30009    | GA                 | United States |
      | Pompano Beach | 33063    | FL                 | United States |
      | Agawam        | 01001    | MA                 | United States |