Feature: getApi with query parameter

Scenario: get all active users 
* def query = {status : 'inactive',gender : 'female', id : 7848299}
Given url baseUrl + '/public/v1/users/'
And params query
When method GET
Then status 200
* print response


Scenario: get all active users and get the count 
* def query = {status : 'active'}
Given url baseUrl + '/public/v1/users/'
And params query
When method GET
Then status 200
* print response
* def count = response.data.length
* print count
* match count == 10
