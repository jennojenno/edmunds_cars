# EdmundsCars

A ruby wrapper for the Edmunds ( <http://www.edmunds.com> ) api for auto information. 

First register for an edmunds developer account at	<http://developer.edmunds.com/>

```ruby
edmunds = EdmundsCars::Models.new("YOUR_API_KEY")
toyota_four_runner = edmunds.by_make_model("toyota","4runner")
```

This will provide a bunch of json about 4Runners. More documentation comings soon!

== Contributing to edmunds_cars
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

== Copyright

Copyright (c) 2013 Conner Wingard. See LICENSE.txt for
further details.

