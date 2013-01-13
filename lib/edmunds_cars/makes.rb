module EdmundsCars
  class Makes < Vehicles
    
    base_uri "http://api.edmunds.com/v1/api/vehicle/makerepository"    
    
    def by_id(make_id)
      self.class.get("/findbyid" , :query => {:id => make_id})
    end
    
    def all
      self.class.get("/findall")
    end

  end  
end