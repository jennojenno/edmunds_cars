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
    BUILD = 'pre1'

    STRING = [MAJOR, MINOR, PATCH, BUILD].compact.join('.')
  end

  BASE_URL = "http://api.edmunds.com"
  

  class << self
    
    def get_available_models
      check_api_keys
    
      url = get_url "vehicle/makerepository/findall"
      result = get_json(url)
      
      make_models = Hash.new
      result["makeHolder"].each do |make|
        make_models[make["name"]] = make["models"].collect{|model_data| model_data["name"]}
      end
    
      make_models
    end
  
    def get_model(make, model_name)
      check_api_keys    
      url = get_url "vehicle/modelrepository/findmodelbymakemodelname", {:make => make, :model=> model_name }
      get_json(url)
    end
  
    def get_reliability_ratings(make, model_name)
      check_api_keys
      vehicle = get_vehicle(make,model_name)
      reliability_attrs = vehicle["attributeGroups"]["RELIABILITY_RATINGS"]

      raise ReliabilityDataUnavailable if reliability_attrs.nil?
      reliability_attrs
    end
    
    def get_categories(make, model_name, model_year=nil)
      check_api_keys
      model_year ||= default_model_year
      vehicle = get_vehicle(make,model_name,model_year)
      vehicle["categories"]
    end
  
    def get_vehicle(make, model_name, model_year=nil)
      check_api_keys
      model_year ||=  default_model_year
      url = get_url "vehicle/#{make}/#{model_name}/#{model_year}"
      data = get_json(url)
      
      vehicles = data["modelYearHolder"]
      raise VehicleNotFound if data["modelYearHolder"].empty?
      vehicles[0]
    end
    
    def get_equipment(id)
      check_api_keys
      url = get_url "vehicle/equipment/#{id}"
      get_json(url)
    end
    
    def get_typically_equipped_tmv(style_id, zip)
      check_api_keys
      url = get_url "tmv/tmvservice/calculatetypicallyequippedusedtmv", {:styleid => style_id, :zip => zip}
      get_json(url)
    end
    
    def get_new_base_tmv(style_id,zip)
      check_api_keys
      url = get_url "tmv/tmvservice/calculatenewtmv", {:styleid => style_id, :zip => zip}
      get_json(url)
    end
    
    private
    
    def get_url(query, query_params={})
      query_params = query_params.collect{|key,value| "#{key}=#{value}"}.join("&")
      url = "#{BASE_URL}/#{version}/api/#{query}?api_key=#{@vehicle_api_key}&fmt=json"
      unless query_params.empty?
        url << "&" << query_params
      end
      url
    end
    
    def get_json(url)
      puts "[#{url}]"
      response = Net::HTTP.get_response(URI.parse(url))
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
