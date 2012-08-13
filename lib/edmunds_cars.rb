require "pp"

require 'json'
require 'net/http'

module EdmundsCars
  
  class EdmundsApiError < StandardError; end;
  
  class ApiKeysNotSet < EdmundsApiError
    def to_s
      "API keys not setup, can't access api"
    end
  end
  
  class ReliabilityDataUnavailable < EdmundsApiError
    def to_s
      "Reliability data not available, model year may be too recent"
    end
  end
  
  class VehicleNotFound < EdmundsApiError
    def to_s
      "Are you sure this model exists?"
    end
  end
  
  module Version
    MAJOR = 0
    MINOR = 1
    PATCH = 0
    BUILD = 'pre2'

    STRING = [MAJOR, MINOR, PATCH, BUILD].compact.join('.')
  end


  BASE_URI = "http://api.edmunds.com"
  BASE_MEDIA_URI = "http://media.ed.edmunds-media.com"
  
  class << self
    
    def get_equipment(id)
      get_edmunds_data "vehicle", "equipment/#{id}", {}
    end
    
    def get_url(api, method, query_params={})
      query_params = query_params.collect{|key,value| "#{key}=#{value}"}.join("&")
      url = "#{BASE_URI}/#{api_version}/api/#{api}/#{method}?api_key=#{vehicle_api_key}&fmt=json"
      unless query_params.empty?
        url << "&" << query_params
      end
  
      puts "[#{url}]"
      url
    end
    
    def get_edmunds_data(*args)
      check_api_keys
  
      uri = get_url *args
      response = Net::HTTP.get_response(URI.parse( uri ))
      JSON.parse(response.body)
    end
    
    
    def check_api_keys
      raise ApiKeysNotSet unless (@vehicle_api_key && @inventory_api_key && @dealer_api_key)
    end
  
  end
  
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__)))

require 'edmunds_cars/configuration'

EdmundsCars.send :extend, EdmundsCars::Configuration


require 'edmunds_cars/defaults'
require 'edmunds_cars/make_ids'
require 'edmunds_cars/makes'
require 'edmunds_cars/models'
require "edmunds_cars/true_market_value"
require "edmunds_cars/true_cost_to_own"
require 'edmunds_cars/styles'
require 'edmunds_cars/vin_decoder'
require "edmunds_cars/consumer_reviews"
require "edmunds_cars/maintenance"
require "edmunds_cars/photos"
require "edmunds_cars/incentives"
