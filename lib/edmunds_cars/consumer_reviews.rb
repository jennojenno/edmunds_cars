module EdmundsCars::ConsumerReviews
  API = "crrrepository"
  
  class << self
  
    def crr_from_make_model_year(make, model, year)
      EdmundsCars.get_edmunds_data API, "getcrrformakemodelyear", {:make => make, :model => model, :year => year}
    end

  end
  
end
  
