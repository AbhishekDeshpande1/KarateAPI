Feature: API Test

Scenario: Get API Test

Given url baseUrl +'/public/v1/users'
And path '30'
When method GET
Then status 200
* print response 
* def jsonResponse = response
* print jsonResponse
* def actualName = jsonResponse.data.name
* print actualName 
* match actualName == 'Jagdeep Gill'