Feature: Spartan API Tests

  Background: setup
    * url 'http://54.196.47.224:8000'
    * header Authorization = call read('basic-auth.js') {username: 'admin', password: 'admin'}
#if it is a javascrpt file we can use 'call' to store the date and re-use it.
  Scenario: Get all spartans
    Given path '/api/spartans'
    When method get
    Then status 200
    * print karate.pretty(response)

  Scenario: Add new spartan and verify status code
    Given path '/api/spartans'
    * def spartan =
    """
        {
        "name": "Camish",
        "gender": "Male",
        "phone": 1112223334
         }
    """
    And request spartan
    When method post
    Then status 201
    And print karate.pretty(response)


#    Scenario: Delete Spartan
#      Given path '/api/spartans/203'
#      When method delete
#      Then status 204
#    * request spartan - body of request
#    * def spartan = read('spartan.json') - spartan is a variable

  Scenario: Add new spartan from external JSON file

    Given path '/api/spartans'
    * def spartan = read('spartan.json')
    * request spartan
    When method post
    * print karate.pretty(response)
    Then status 201
    And assert response.success == 'A Spartan is Born!'

  Scenario: Update spartan
    Given path '/api/spartans/567'
    And request {name: 'Jiujitsu Master', gender: 'Female'}
    And method patch
    * print karate.pretty(responseHeaders)
    Then status 204
    * header Authorization = token
    * path '/api/spartans/567'
    When method get
    * print karate.pretty(response)
