module EdmundsCars::Makes
  API = "vehicle/makerepository"
  
  class << self
    
    def by_id(make_id)
      EdmundsCars.get_edmunds_data API, "findbyid" , {:id => make_id}
    end
    
    def all
      result = EdmundsCars.get_edmunds_data API, "findall", {}
      
      makes = {}
      result["makeHolder"] .each do |make|
        makes[make["name"]] = make["id"]
      end
      
      makes
    end

    def available_models
      result = find_all
      
      make_models = Hash.new
      result["makeHolder"].each do |make|
        make_models[make["name"]] = make["models"].collect{|model_data| model_data["name"]}
      end
      make_models
    end
    
  end
  
end