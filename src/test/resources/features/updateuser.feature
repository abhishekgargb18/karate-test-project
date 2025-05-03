Feature: update a user using put api

  Background: 
    * url baseUrl
    * def randomString =
      """
      function() {
        return Math.random().toString(36).substring(2, 10);
      }
      """
    * def randomEmail = randomString() + '@gmail.com'
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

  Scenario: update a user using above data
    # create a user with post call
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
    # fetch the user id from the above post call
    * print response.data.id
    * def userid = $.data.id
    # put call - to update the user
     * def requestputPayload =
      """
      {
     
      "gender" : "female",
      "status" : "inactive"
      
      }
      """
    
    Given path '/public/v1/users/' + userid
    And request requestputPayload
    And header Authorization = tokenID
    When method put
    Then status 200
    * print response
    And match $.data.id == '#present'
    And match $.data.id == userid
    And match $.data.name  == '#present'
    And match $.data.name  == 'tom1'
    And match $.data.email == '#present'
    And match $.data.email == requestPayload.email
