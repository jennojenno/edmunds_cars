module EdmundsCars::Styles

  API = "vehicle/stylerepository"
  
  class << self
    
    def by_id(id)
      EdmundsCars.get_edmunds_data API, "findbyid", {:id => id}
    end
  
    def by_make_and_model_year(make, model_name, model_year)
      model_year ||= default_model_year
      EdmundsCars.get_edmunds_data API, "findstylesbymakemodelyear", {:make=>make, :model=> model_name, :year => model_year}
    end
  
    def by_model_year_id(id)
      EdmundsCars.get_edmunds_data API, "findstylebymakemodelyearid", {:modelyearid => id}
    end
    
  end
  
end
