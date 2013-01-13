module EdmundsCars
  class Styles < Vehicles
 
    base_uri "http://api.edmunds.com/v1/api/vehicle/stylerepository"
    
    def by_id(id)
      self.class.get("/findbyid", :query => {:id => id})
    end
  
    def by_make_model_year(make, model_name, model_year)
      self.class.get("/findstylesbymakemodelyear", :query => {:make=>make, :model=> model_name, :year => model_year})
    end
  
    def by_model_year_id(id)
      self.class.get("/findstylebymakemodelyearid", :query => {:modelyearid => id})
    end
    
  end
end
