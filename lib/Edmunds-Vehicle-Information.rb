require 'json'
require 'net/http'

class ApiKeysNotSet < StandardError
  def initialize
    super("One or more api keys is not set")
  end
end


class EdmundsVehicleInformation
  module Version
    MAJOR = 0
    MINOR = 1
    PATCH = 0
    BUILD = 'pre1'

    STRING = [MAJOR, MINOR, PATCH, BUILD].compact.join('.')
  end
  
  attr_accessor :vehicle_api_key, :inventory_api_key, :dealer_api_key, :version
  
  BASE_URL = "http://api.edmunds.com"

  def get_available_models
    
    check_api_keys
    
    url = "#{BASE_URL}/#{@version}/api/vehicle/makerepository/findall?api_key=#{@vehicle_api_key}&fmt=json"
    
    result = get_json(url)
    make_models = Hash.new
    
    result["makeHolder"].each do |make|
      make_models[make["name"]] = make["models"].collect{|model_data| model_data["name"]}
    end
    
    make_models
  end
  
  def get_model(make,model_name)
    check_api_keys
    
    url = "#{BASE_URL}/#{@version}/api/vehicle/modelrepository/findmodelbymakemodelname?make=#{make}&model=#{model_name}&api_key=#{@vehicle_api_key}&fmt=json"
    model_data = get_json(url)
        
    model_data
  end
  
  def get_reliability_ratings(make, model_name)
    vehicle = get_vehicle(make,model_name)
    vehicle["RELIABILITY_RATINGS"]
  end
    
  def get_categories(make,model_name)
    vehicle = get_vehicle(make,model_name)
    vehicle["categories"]
  end
  
  def get_vehicle(make,model_name,year="2012")
    check_api_keys
    
    url = "#{BASE_URL}/#{@version}/api/vehicle/#{make}/#{model_name}/#{year}?api_key=#{@vehicle_api_key}&fmt=json"
    result = get_json(url)
    
    result
  end
  
  
  private
  
  def get_json(url)
    response = Net::HTTP.get_response(URI.parse(url))
    return JSON.parse(response.body)
  end  
  
  def check_api_keys
    if !@vehicle_api_key || !@inventory_api_key || !@dealer_api_key
      raise ApiKeysNotSet
    end
  end
end