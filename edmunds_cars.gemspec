$LOAD_PATH << File.join(File.dirname(__FILE__),'lib')
require "edmunds_cars/version"

Gem::Specification.new do |s|
  s.name = "edmunds_cars"
  s.version = EdmundsCars::VERSION

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Conner Wingard"]
  s.date = "2013-01-13"
  s.description = "Easily query information about cars through the edmunds api. "
  s.email = "conner@connerwingard.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    "Gemfile",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "lib/edmunds_cars.rb",
    "lib/edmunds_cars/consumer_reviews.rb",
    "lib/edmunds_cars/incentives.rb",
    "lib/edmunds_cars/maintenance.rb",
    "lib/edmunds_cars/make_ids.rb",
    "lib/edmunds_cars/makes.rb",
    "lib/edmunds_cars/models.rb",
    "lib/edmunds_cars/photos.rb",
    "lib/edmunds_cars/styles.rb",
    "lib/edmunds_cars/true_cost_to_own.rb",
    "lib/edmunds_cars/true_market_value.rb"
  ]
  s.homepage = "http://github.com/ConnerMan/edmunds_cars"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "A wrapper for the edmunds.com REST api"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, [">= 0"])
      s.add_runtime_dependency(%q<httparty>, ["~> 0.9.0"])
    else
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<rdoc>, [">= 0"])
      s.add_dependency(%q<httparty>, ["~> 0.9.0"])
    end
  else
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<rdoc>, [">= 0"])
    s.add_dependency(%q<httparty>, ["~> 0.9.0"])
  end
end

