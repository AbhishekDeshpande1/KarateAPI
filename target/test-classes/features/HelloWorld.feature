Feature: print hellow world

Scenario: Hellow Word Scenario 

		* print 'Hellow Abhi'

		Scenario: calculator scenario 
		
				 * def a = 200
				 * def b = 2
				 * print 'mul ->' +(a * b)
				 
Scenario: Json Reader Parser

			 * def cad =
		"""
		[
		{
		"name" : "Abhi",
		"City" : "Pune",
		"age"  :	28
		},
		{
		"name" : "Maddy",
		"City" : "Mumbai",
		"age"  :	24
		}
		]
		"""
		
			* print cad
			* print cad[1].name		 

			
			Scenario: get user details 
Given url 'https://gorest.co.in/public/v1/users'
And path 30 
When method GET 
Then status 200