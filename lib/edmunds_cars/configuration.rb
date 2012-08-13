module EdmundsCars::Configuration
  
  attr_accessor :vehicle_api_key, :inventory_api_key, :dealer_api_key
    
  def configure(&block)
    instance_exec(&block)
  end
  
  def default_model_year(year=nil)
    return @default_model_year if defined? @default_model_year and year.nil?
    @default_model_year = (year || Time.now.year)
  end
  
  def api_version(v=nil)
    return @version if defined? @version and v.nil?
    @version = (v || 'v1')
  end
  
end