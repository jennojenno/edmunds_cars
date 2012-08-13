module EdmundsCars::TrueMarketValue
  API = "tmv/tmvservice"
  
  class << self
  
    def typically_equipped(style_id, zip)
      EdmundsCars.get_edmunds_data API, "calculatetypicallyequippedusedtmv", {:styleid => style_id, :zip => zip}
    end
    
    def new_base(style_id,zip)
      EdmundsCars.get_edmunds_data API, "calculatenewtmv", {:styleid => style_id, :zip => zip}
    end
    
    def used(style_id, condition, mileage, zip)
      EdmundsCars.get_edmunds_data API, "calculateusedtmv", {:styleid => style_id, :condition => condition, :mileage => mileage, :zip => zip}
    end
  

    def certified_price_for_style(style_id, zip)
      url = EdmundsCars.get_url API, "findcertifiedpriceforstyle", {:styleid => style_id, :zip => zip}
      response = Net::HTTP.get_response(URI.parse(url))
      #oddly not in json format
      response.body
    end
    
    def cpo_years_by_make(make_id)
      EdmundsCars.get_edmunds_data "tmv/tmvservice/findcpoyearsbymake", {:makeid => make_id}
    end
    
  end
  
end
  
