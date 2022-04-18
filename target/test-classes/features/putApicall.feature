Feature: Generate random string 

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
  
Scenario: Create a user with the given data
Given path '/public/v1/users'	
And request requestPayload
And header Authorization = 'Bearer ' + tokenID
When method post
Then status 201 
And match $.data.id == '#present'


# put  scenario 2 call 

	* def requestPutPayload = 
	"""
	{ 
        "name": "Maddy",
        "gender": "male", 
        "status": "inactive"
    }
	
	"""  
* def userId = $.data.id
* print userId

Given path '/public/v1/users/' +userId
And request requestPutPayload
And header Authorization = 'Bearer ' + tokenID
When method put
Then status 200 
And match $.data.id == userId
And match $.data.name == 'Maddy'
And match $.data.email == requestPayload.email
