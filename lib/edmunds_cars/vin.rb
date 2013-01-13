module EdmundsCars
  class Vin < Vehicles
    
    base_uri "http://api.edmunds.com/v1/api/toolsrepository"

    def decode(vin)
      self.class.get("/vindecoder", :query => {:vin => vin})
    end

  end  
end
  
