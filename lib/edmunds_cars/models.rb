module EdmundsCars
  class Models < Vehicles
    
    base_uri "http://api.edmunds.com/v1/api/vehicle"

    def by_make_model(make, model)
      self.class.get("/vehicle/modelrepository/findmodelbymakemodelname", :query => {:make => make, :model=> model_name })
    end
    
    def by_make_model_year(make, model, model_year = Time.now.year)
      self.class.get("/vehicle/#{make}/#{model}/#{model_year}")
    end

  end
end
