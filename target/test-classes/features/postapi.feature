Feature: create user using post api

  Background: 
    * url baseUrl
    * def requestPayload =
      """
      {
      "name" : "tom1",
      "email" : "tom3@gmail.com",
      "gender" : "male",
      "status" : "active"
      
      }
      """

  Scenario: create a user using above data
    Given path '/public/v1/users/'
    And request requestPayload
    And header Authorization = tokenID
    When method post
    Then status 201
    * print response
    And match $.data.id == '#present'
    And match $.data.name  == '#present'
    And match $.data.email == '#present'
    And match $.data.email == 'tom3@gmail.com'
