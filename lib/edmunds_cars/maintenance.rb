module EdmundsCars
  class Maintenance < Vehicles

    base_uri "http://api.edmunds.com/v1/api/maintenance"

    def service_bulletins_by_model_year_id(id)
      self.class.get("/servicebulletinrepository/findbymodelyearid", :query => {:modelyearid => id})
    end

    def service_bulletin_by_id(id)
      self.class.get("/servicebulletin/#{id}")
    end

    def style_notes_by_id(id)
      self.class.get("/stylenotes/#{id}")
    end

    def labor_rates_by_zip
      self.class.get("/ziplaborrate/#{zipcode}")
    end

    def recall_by_id(id)
      self.class.get("/recall/#{id}")
    end

    def recall_by_model_year_id(model_year_id)
      self.class.get("/recallrepository", :query => {:modelyearid => model_year_id})
    end

  end
end
  
