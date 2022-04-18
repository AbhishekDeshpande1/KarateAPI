Feature: Delete user 

Background: 
* url 'https://gorest.co.in'

  * def random_string =  
  """
  function(s){
 	var text = "";
 	var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890"
	 		for (var i=0; i<s;i++)
	 	text += pattern.charAt(Math.floor(Math.random() * pattern.length()))
	 		return text;
 		 }	
 		 
  """
   	* def randomString = random_string(10)
	* print randomString

   
	* def requestPayload = 
	"""
	{ 
        "name": "abhi",
        "gender": "male", 
        "status": "active"
    }
	
	"""  
 * set requestPayload.email = randomString + "@gmail.com"
   	* print requestPayload.email
# Create user   	  
Scenario: Create a user with the given data
Given path '/public/v1/users'	
And request requestPayload
And header Authorization = 'Bearer ' + tokenID
When method post
Then status 201 
And match $.data.id == '#present'

#2 Delete user 
   	  
* def userId = $.data.id
* print userId

Given path '/public/v1/users/' +userId
And header Authorization = 'Bearer ' + tokenID
When method delete
Then status 204

#2 Delete user 
   	  
Given path '/public/v1/users/' +userId
And header Authorization = 'Bearer ' + tokenID
When method get
Then status 404
And match $.data.message == 'Resource not found'

