Feature: get api

Scenario: get user details
Given url baseUrl + '/public/v1/users/'
And path '7848302'
When method GET
Then status 200
* print response
* def actname = response.data.name
* print actname


Scenario: get user details not found
Given url 'https://gorest.co.in/public/v1/users'
And path '3'
When method GET
Then status 404