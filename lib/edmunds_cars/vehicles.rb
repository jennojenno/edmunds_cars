module EdmundsCars

  class Vehicles
    include HTTParty

    base_uri "http://api.edmunds.com/v1/api"
    default_params :fmt => "json"

    def initialize(key)
      self.class.default_params :api_key => key
    end

  end
end