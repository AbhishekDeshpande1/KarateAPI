Feature: Post Call


Background: 
* url 'https://gorest.co.in'
	* def requestPayload = read('classpath:payload/postapi.json')
	
	 	
		* def pqr = call read('classpath:randomString.js',{10}) 
		* def email = pqr
		 * print email		 	
	 	* set requestPayload.email = email + "@gmail.com"
   	* print requestPayload.email
 
	
Scenario: Create a user with the given data
Given path '/public/v1/users'	
And request requestPayload
And header Authorization = 'Bearer ' + tokenID
When method post
Then status 201 
And match $.data.id == '#present'
And match $.data.name == 'abhishek'
