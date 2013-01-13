module EdmundsCars
  class TrueCostToOwn < Vehicles

    base_uri "http://api.edmunds.com/v1/api/tco"

    def new_by_style_id_and_zip(style_id, zip)
      self.class.get("/newtruecosttoownbystyleidandzip/#{style_id}/#{zip}")
    end    

    def used_by_style_id_and_zip(style_id, zip)
      self.class.get("/usedtruecosttoownbystyleidandzip/#{style_id}/#{zip}")
    end
    
    def makes_with_data
      self.class.get("/getmakeswithtcodata")
    end    

    def models_with_data(make_id)
      self.class.get("/getmodelswithtcodata", :query => {:makeid => make_id})
    end

    def styles_with_data_by_submodel(make, model, year, submodel)
      self.class.get("/getstyleswithtcodatabysubmodel", {
        :make => make, 
        :model => model, 
        :year => year, 
        :submodel => submodel
      })
    end

  end
end

  
