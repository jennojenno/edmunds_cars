module EdmundsCars
  class ConsumerReviews < Vehicles
  
    base_uri "http://api.edmunds.com/v1/api/crrrepository"    
  
    def by_make_model_year(make, model, year)
      self.class.get("/getcrrformakemodelyear", :query => {:make => make, :model => model, :year => year})
    end

  end
end
  
