module EdmundsCars
  class Depreciation < Vehicles

    base_uri "http://api.edmunds.com/v1/api/tco/depreciation"

    # Get the depreciation value in dollars over the next 5 years for a used vehicle by Style ID and zipcode
    def used_rates_by_styleid_and_zip(style_id, zip)
      self.class.get("/usedratesbystyleidandzip/#{style_id}/#{zip}")
    end
    
    # Get the depreciation value in dollars over the next 5 years for a new vehicle by Style ID and zipcode
    def new_rates_by_styleid_and_zip(style_id, zip)
      self.class.get("/newratesbystyleidandzip/#{style_id}/#{zip}")
    end

  end
end