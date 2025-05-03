Feature: create user using post api with random email

  Background: 
    * url baseUrl
    * def randomString =
      """
      function() {
        return Math.random().toString(36).substring(2, 10);
      }
      """
    * def randomEmail = randomString() + '@gmail.com'

  Scenario: Create a random email
    * print 'Random Email:', randomEmail

  Scenario: create a user using above data
    * def requestPayload =
      """
      {
      "name" : "tom1",
      "gender" : "male",
      "status" : "active"
      
      }
      """
    * set requestPayload.email = randomEmail
    * print requestPayload
    Given path '/public/v1/users/'
    And request requestPayload
    And header Authorization = tokenID
    When method post
    Then status 201
    * print response
    And match $.data.id == '#present'
    And match $.data.name  == '#present'
    And match $.data.email == '#present'
    And match $.data.email == requestPayload.email
