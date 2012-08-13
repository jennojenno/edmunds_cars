module EdmundsCars::VinDecoder
  API = "toolsrepository"
  
  class << self
  
    def vehicle_from_vin(vin)
      EdmundsCars.get_edmunds_data API, "vindecoder", {:vin => vin}
    end

  end
  
end
  
