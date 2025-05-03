Feature: delete user with delete api

  Background: 
    * url baseUrl
    * def randomString =
      """
      function() {
        return Math.random().toString(36).substring(2, 10);
      }
      """
    * def randomEmail = randomString() + '@gmail.com'
    * def requestpayload =
      """
      {
      "name" : "tom1",
      "gender" : "male",
      "status" : "active"
      
      }
      """
    * set requestpayload.email = randomEmail
    * print requestpayload
    
    Scenario: delete user 
    # first create a user
    Given path '/public/v1/users/'
    And header Authorization = tokenID
    And request  requestpayload
    When method post
    Then status 201
    * print response
    
    # fetch user id
    * def userid = $.data.id
    
    # delete the same user
    
    Given path '/public/v1/users/' + userid
    And header Authorization = tokenID
    When method delete
    Then status 204
    * print response
    
    # get the same user with same user id
    
        
    Given path '/public/v1/users/' + userid
    And header Authorization = tokenID
    When method get
    Then status 404
    * print response
    
    
     