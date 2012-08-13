module EdmundsCars::Maintenance
  API = "maintenance"
  
  module ServiceBulletins 
    class << self
      def by_model_year_id(id)
        EdmundsCars.get_edmunds_data API, "servicebulletinrepository/findbymodelyearid", {:modelyearid => id}
      end    
    
      def by_id(id)
        EdmundsCars.get_edmunds_data API, "servicebulletin/#{id}", {}
      end
    end
  end
  
  module StylesNotes
    class << self
      def by_id(id)
        EdmundsCars.get_edmunds_data API, "stylesnotes/#{id}", {}
      end
    end
  end
  
  module ZipLaborRate
    class << self
      def by_zipcode(zipcode)
        EdmundsCars.get_edmunds_data API, "ziplaborrate/#{zipcode}", {}
      end
    end
  end
  
  
  module Recall
    class << self
      def by_id(id)
        EdmundsCars.get_edmunds_data API, "recall/#{id}", {}
      end
    
      def by_model_year_id(model_year_id)
        EdmundsCars.get_edmunds_data API, "recallrepository/#{id}", {:modelyearid => model_year_id}
      end
    end
  end
  
end
  
