Feature: Query Parameter with API

Scenario: Query Param 
* def query = {status:active,gender:male,id:3316}

Given url baseUrl +'/public/v1/users'
And params query
When method GET
Then status 200
* print response 

Scenario: Get User count
* def query = {status:active}
Given url baseUrl +'/public/v1/users'
And params query
When method GET
Then status 200
* def jsonResponse = response 
* def userCount = response.data.length
* print userCount
* match userCount == 2

Scenario: Query Param with configure
Given url baseUrl +'/public/v1/users'
 * configure params = {status:'active'}

When method GET
Then status 200
* def jsonResponse = response 
* def userCount = response.data.length
* print userCount
* match userCount == 20