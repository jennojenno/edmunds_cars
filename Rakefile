# encoding: utf-8
require 'rubygems'
require 'bundler'
require './lib/edmunds_cars/version'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name        = "edmunds_cars"
  gem.homepage    = "http://github.com/ConnerMan/edmunds_cars"
  gem.license     = "MIT"
  gem.summary     = %Q{A wrapper for the edmunds.com REST api}
  gem.description = %Q{Easily query information about cars through the edmunds api. }
  gem.email       = "conner@connerwingard.com"
  gem.version     = EdmundsCars::VERSION
  gem.authors     = ["Conner Wingard"]

  gem.require_paths = ["lib"]

  gem.add_dependency("httparty","~> 0.9.0")
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new do |t|
  t.test_files = FileList['spec/lib/edmunds_cars/*_spec.rb']
  t.verbose = true
  t.warning = true
end
task :default => :test


require 'rdoc/task'
RDoc::Task.new do |rdoc|
  version = EdmundsCars::VERSION

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "edmunds_cars #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
