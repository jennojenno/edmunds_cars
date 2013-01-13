module EdmundsCars

  # FROM EDMUNDS DOCUMENTATION
  # The Total Cash Price displayed is the vehicle's True Market Value (TMV) price plus typically equipped options, 
  # destination charge, base tax and fees assessed by your state, and, if applicable, gas guzzler tax; less any 
  # widely available manufacturer-to-customer cash rebates. (However, we do not account for other types of cash 
  # rebates or incentives because of the variability of those offers and their eligibility requirements.
  class TotalCashPrice < Vehicles
    
    base_uri "http://api.edmunds.com/v1/api/tco"
    
    def new_by_styleid_and_zip(style_id, zip)
      self.class.get("/newtotalcashpricebystyleidandzip/#{style_id}/#{zip}")
    end
    
    def used_by_styleid_and_zip(style_id, zip)
      self.class.get("/usedtotalcashpricebystyleidandzip/#{style_id}/#{zip}")
    end

  end  
end