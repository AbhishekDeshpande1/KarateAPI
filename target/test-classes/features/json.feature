Feature: Json Object testing
Scenario: Json Reader Parser

		* def jsonObject =
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
		
			* print jsonObject
