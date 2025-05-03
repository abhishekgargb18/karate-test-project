
Feature: create user using post api

  Background: 
    * url baseUrl
    * def requestPayload =
      """
      {
      
      "status" : "inactive"
      
      }
      """

  Scenario: create a user using above data
    Given path '/public/v1/users/7861586'
    And request requestPayload
    And header Authorization = tokenID
    When method patch
    Then status 200
    * print response
    And match $.data.id == '#present'
    And match $.data.name  == '#present'
    And match $.data.email == '#present'
    And match $.data.email == 'tom6@gmail.com'
