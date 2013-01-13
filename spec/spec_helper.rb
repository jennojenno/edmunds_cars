require 'edmunds_cars'

require 'turn/autorun'
require 'webmock/minitest'
require 'vcr'
Turn.config do |c|
 # :outline  - turn's original case/test outline mode [default]
 c.format  = :outline
 # turn on invoke/execute tracing, enable full backtrace
 c.trace   = 5
 c.verbose = true
 # use humanized test names (works only with :outline format)
 c.natural = true
end
#VCR config
VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vehicle_cassettes'
  c.hook_into :webmock
end