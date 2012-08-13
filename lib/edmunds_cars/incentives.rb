module EdmundsCars::Incentives
  API = "incentive/incentiverepository"
  
  class << self
  
    def by_style_id(style_id)
      EdmundsCars.get_edmunds_data API, "findincentivesbystyleid", {:styleid => style_id}
    end

  end
  
end
  
