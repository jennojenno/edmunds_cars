module EdmundsCars
  class Photos < Vehicles

    base_uri "http://api.edmunds.com/v1/api/vehiclephoto/service"

    def by_style_id(style_id)
      self.class.get("/findphotosbystyleid", {:styleId => style_id})
    end
    
  end
end
  
