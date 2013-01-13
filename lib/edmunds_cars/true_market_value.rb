module EdmundsCars
  class TrueMarketValue < Vehicles

    base_uri "http://api.edmunds.com/v1/api/tmv/tmvservice"

    def typically_equipped(style_id, zip)
      self.class.get("/calculatetypicallyequippedusedtmv", :query => {:styleid => style_id, :zip => zip})
    end

    def new_base(style_id, zip)
      self.class.get("/calculatenewtmv", :query => {:styleid => style_id, :zip => zip})
    end
    
    def used(style_id, condition, mileage, zip)
      self.class.get("/calculateusedtmv", :query => {:styleid => style_id, :condition => condition, :mileage => mileage, :zip => zip})
    end

    def certified_price_for_style(style_id, zip)
      self.class.get_url("/findcertifiedpriceforstyle", :query => {:styleid => style_id, :zip => zip})
    end

    def cpo_years_by_make(make_id)
      self.class.get_url("/findcpoyearsbymake", :query => {:makeid => make_id})
    end

  end
end
  
