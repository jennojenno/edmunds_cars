module EdmundsCars
  class Incentives < Vehicles
    
    base_uri "http://api.edmunds.com/v1/api/incentive/incentiverepository"    

    def by_style_id(style_id)
      self.class.get("/findincentivesbystyleid", :query => {:styleid => style_id})
    end
    
  end
end
  
