# EdmundsCars

A ruby wrapper for the Edmunds ( <http://www.edmunds.com> ) api for auto information. 

First register for an edmunds developer account at	<http://developer.edmunds.com/>


Then you can begin using the apis, first setup your keys. 


	EdmundsCars.vehicle_api_key = "xxxxxxxxxxxxxxxxxxxxxxxxx"
	EdmundsCars.inventory_api_key = "xxxxxxxxxxxxxxxxxxxxxxxxx"
	EdmundsCars.dealer_api_key = "xxxxxxxxxxxxxxxxxxxxxxxxx"

An example to get all available makes.


	EdmundsCars::Makes.all
	
Which would return:

	{"AM General"=>200347864,
	 "Acura"=>200002038,
	 "Aston Martin"=>200001769,
	 "Audi"=>200000001,
	 "BMW"=>200000081,
	 "Bentley"=>200005848,
	 "Bugatti"=>200030397,
	 "Buick"=>200006659,
	 "Cadillac"=>200001663,
	 "Chevrolet"=>200000404,
	 "Chrysler"=>200003644,
	 "Daewoo"=>200312185,
	 "Dodge"=>200009788,
	 "Eagle"=>200347865,
	 "FIAT"=>200033022,
	 "Ferrari"=>200006023,
	 "Fisker"=>200005745,
	 "Ford"=>200005143,
	 "GMC"=>200007302,
	 "Geo"=>200347866,
	 "HUMMER"=>200004021,
	 "Honda"=>200001444,
	 "Hyundai"=>200001398,
	 "Infiniti"=>200000089,
	 "Isuzu"=>200110731,
	 "Jaguar"=>200003196,
	 "Jeep"=>200001510,
	 "Kia"=>200003063,
	 "Lamborghini"=>200005922,
	 "Land Rover"=>200006582,
	 "Lexus"=>200001623,
	 "Lincoln"=>200001777,
	 "Lotus"=>200006242,
	 "MINI"=>200002305,
	 "Maserati"=>200028029,
	 "Maybach"=>200043087,
	 "Mazda"=>200004100,
	 "McLaren"=>200051397,
	 "Mercedes-Benz"=>200000130,
	 "Mercury"=>200007711,
	 "Mitsubishi"=>200002915,
	 "Nissan"=>200000201,
	 "Oldsmobile"=>200249342,
	 "Panoz"=>200194838,
	 "Plymouth"=>200339126,
	 "Pontiac"=>200002634,
	 "Porsche"=>200000886,
	 "Ram"=>200393150,
	 "Rolls-Royce"=>200005044,
	 "SRT"=>200412738,
	 "Saab"=>200074504,
	 "Saturn"=>200004446,
	 "Scion"=>200006515,
	 "Spyker"=>200046567,
	 "Subaru"=>200004491,
	 "Suzuki"=>200001853,
	 "Tesla"=>200018920,
	 "Toyota"=>200003381,
	 "Volkswagen"=>200000238,
	 "Volvo"=>200010382,
	 "smart"=>200038885}

Lets pretend we are an aspiring architect. We only care about Saab, which has an id of 200074504.
To get more information of our beloved saab (may she rest in peace) we could do the following:

	EdmundsCars::Makes.by_id(200074504)

Which would return this from edmunds:

	{"makeHolder"=>
	  [{"id"=>200074504,
	    "models"=>
	     [{"link"=>"/api/vehicle/saab/9000", "id"=>"Saab_9000", "name"=>"9000"},
	      {"link"=>"/api/vehicle/saab/95", "id"=>"Saab_9_5", "name"=>"9-5"},
	      {"link"=>"/api/vehicle/saab/94x", "id"=>"Saab_9_4X", "name"=>"9-4X"},
	      {"link"=>"/api/vehicle/saab/93", "id"=>"Saab_9_3", "name"=>"9-3"},
	      {"link"=>"/api/vehicle/saab/92x", "id"=>"Saab_9_2X", "name"=>"9-2X"},
	      {"link"=>"/api/vehicle/saab/97x", "id"=>"Saab_9_7X", "name"=>"9-7X"},
	      {"link"=>"/api/vehicle/saab/900", "id"=>"Saab_900", "name"=>"900"},
	      {"link"=>"/api/vehicle/saab/93griffin",
	       "id"=>"Saab_9_3_Griffin",
	       "name"=>"9-3 Griffin"}],
	    "name"=>"Saab",
	    "niceName"=>"saab",
	    "manufacturer"=>nil,
	    "attributeGroups"=>{}}]}

Nifty. Obviously we want to learn more about the 93 so we use the following api:

	EdmundsCars::Models.vehicle("saab","93","2011")

Which would return enough info to satisfy any cravings for Saab. 

All of the methods closely parallel edmunds api methods. Look at their documentation for more info about the response format.

== Contributing to edmunds_cars
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

== Copyright

Copyright (c) 2012 Conner Wingard. See LICENSE.txt for
further details.

