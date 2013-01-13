module EdmundsCars
  class Resale < Vehicles

    base_uri "http://api.edmunds.com/v1/api/tco"

    def by_styleid_and_zip(style_id, zip)
      self.class.get("/resalevaluesbystyleidandzip/#{style_id}/#{zip}")
    end     

  end
end