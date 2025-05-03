Feature: get api using  auth token

Scenario: authtoken

* print tokenID
Given header Authorization = tokenID
Given url baseUrl + '/public/v1/users/'
#And path '7848302'
When method GET
Then status 200
* print response
