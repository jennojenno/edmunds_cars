module EdmundsCars::TrueCostToOwn
  API = "tco"
  
  class << self
  
    # Get the True Cost to Own value for a used vehicle by Style ID and zipcode
    def new_by_styleid_and_zip(style_id, zip)
      EdmundsCars.get_edmunds_data API, "newtruecosttoownbystyleidandzip/#{style_id}/#{zip}", {}
    end
    
    # Get the True Cost to Own value for a used vehicle by Style ID and zipcode
    def used_by_styleid_and_zip(style_id,zip)
      EdmundsCars.get_edmunds_data API, "usedtruecosttoownbystyleidandzip/#{style_id}/#{zip}", {}
    end
    
    # Get a list of all makes that have a True Cost to Own data
    def makes_with_tco_data
      EdmundsCars.get_edmunds_data API, "getmakeswithtcodata", {}
    end
    
    # Get a list of all models that have a True Cost to Own data
    def models_with_tco_data(make_id)
      EdmundsCars.get_edmunds_data API, "getmodelswithtcodata", {:makeid => make_id}
    end
    # Get a list of all styles that have a True Cost to Own data
    def styles_with_tco_data_by_submodel(make, model, year, submodel)
      EdmundsCars.get_edmunds_data API, "getstyleswithtcodatabysubmodel", {:make => make, :model => "model", :year => year, :submodel => submodel}
    end
    
  end
  
  module Resale
    class << self
      
      # Get the Resale Value over the next 5 years for a particular vehicle by Style ID and zipcode
      def by_styleid_and_zip(style_id, zip)
        EdmundsCars.get_edmunds_data API, "resalevaluesbystyleidandzip/#{style_id}/#{zip}", {}
      end
      
    end
  end
  
  # The Total Cash Price displayed is the vehicle's True Market Value (TMV) price plus typically equipped options, 
  # destination charge, base tax and fees assessed by your state, and, if applicable, gas guzzler tax; less any 
  # widely available manufacturer-to-customer cash rebates. (However, we do not account for other types of cash 
  # rebates or incentives because of the variability of those offers and their eligibility requirements.
  module TotalCashPrice
    class << self
      
      def new_by_styleid_and_zip(style_id, zip)
        EdmundsCars.get_edmunds_data API, "newtotalcashpricebystyleidandzip/#{style_id}/#{zip}", {}
      end
      
      def used_by_styleid_and_zip(style_id, zip)
        EdmundsCars.get_edmunds_data API, "usedtotalcashpricebystyleidandzip/#{style_id}/#{zip}", {}
      end
            
    end
  end
  
  module Depreciation
    class << self
      
      # Get the depreciation value in dollars over the next 5 years for a used vehicle by Style ID and zipcode
      def used_rates_by_styleid_and_zip(style_id, zip)
        EdmundsCars.get_edmunds_data API, "depreciation/usedratesbystyleidandzip/#{style_id}/#{zip}", {}
      end
      
      # Get the depreciation value in dollars over the next 5 years for a new vehicle by Style ID and zipcode
      def new_rates_by_styleid_and_zip(style_id, zip)
        EdmundsCars.get_edmunds_data API, "depreciation/newratesbystyleidandzip/#{style_id}/#{zip}", {}
      end
      
    end
  end
    
end
  
