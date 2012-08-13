module EdmundsCars::Models
  
  API = "vehicle/modelrepository"
  
  class << self
    
    def by_make_and_model_name(make, model_name)
      EdmundsCars.get_edmunds_data API, "findmodelbymakemodelname", {:make => make, :model=> model_name }
    end
  
    def reliability_ratings(make, model_name)
      vehicle = get_vehicle(make,model_name)
      reliability_attrs = vehicle["attributeGroups"]["RELIABILITY_RATINGS"]

      raise ReliabilityDataUnavailable if reliability_attrs.nil?
      reliability_attrs
    end
    
    def categories(make, model_name, model_year=nil)
      model_year ||= default_model_year
      vehicle = get_vehicle(make,model_name,model_year)
      vehicle["categories"]
    end
  
    def vehicle(make, model_name, model_year=nil)
      model_year ||=  default_model_year
      data = EdmundsCars.get_edmunds_data "vehicle", "#{make}/#{model_name}/#{model_year}"

      vehicles = data["modelYearHolder"]
      raise VehicleNotFound if data["modelYearHolder"].empty?
      vehicles[0]
    end
  
  end

end
