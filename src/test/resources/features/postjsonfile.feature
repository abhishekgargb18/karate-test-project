Feature: create user using post api

  Background: 
    * url baseUrl
    * header Authorization = tokenID
    * def requestPayload = read('classpath:payload/user.json' )

  Scenario: create a user using above data
    Given path '/public/v1/users/'
    And request requestPayload
    When method post
    Then status 201
    * print response
    And match $.data.id == '#present'
    And match $.data.name  == '#present'
    And match $.data.email == '#present'
    And match $.data.email == requestPayload.email
