require File.expand_path('../../../spec_helper', __FILE__)

describe EdmundsCars::Vehicles do
  before do
    @edmunds = EdmundsCars::Vehicles.new( ENV['edmunds_vehicle_api'])
  end

  describe "default attributes" do
    it "must include httparty methods" do
      EdmundsCars::Vehicles.must_include HTTParty
    end
    
    it "must have the base url set to the edmunds api endpoint" do
      EdmundsCars::Vehicles.base_uri.must_equal "http://api.edmunds.com/v1/api"
    end

    it "must set api key" do
      EdmundsCars::Vehicles.default_params[:api_key].must_equal ENV['edmunds_vehicle_api']
    end

    it "must set format to json" do
      EdmundsCars::Vehicles.default_params[:fmt].must_equal "json"
    end
    
  end
end

describe EdmundsCars::TrueMarketValue do 
  before do 
    @edmunds = EdmundsCars::TrueMarketValue.new( ENV['edmunds_vehicle_api'] )
  end

  it "implement all api methods" do 
    @edmunds.must_respond_to :new_base
    @edmunds.must_respond_to :typically_equipped
    @edmunds.must_respond_to :used
  end

  it "get new base" do
    VCR.use_cassette("4Runner_tmv") do 
      data = @edmunds.new_base('101351498','01741')
      refute_nil data
      data["tmv"]["nationalBasePrice"]["baseMSRP"].must_equal 36555.0
    end      
  end

  it "get typically_equipped" do
    VCR.use_cassette("4Runner_typical_tmv") do 
      data = @edmunds.typically_equipped('101351498','01741')
      refute_nil data
    end
  end
end

describe EdmundsCars::Vin do
  before do
    @edmunds = EdmundsCars::Vin.new( ENV['edmunds_vehicle_api'])
  end

  it "decode vehicle from a vin" do
    VCR.use_cassette("4Runner_vin") do
      data = @edmunds.decode "JTEBU5JR8B5045387"
      data["styleHolder"][0]["makeName"].must_equal "Toyota"
    end
  end
end

describe EdmundsCars::TrueCostToOwn do
  before do
    @edmunds = EdmundsCars::TrueCostToOwn.new( ENV['edmunds_vehicle_api'])
  end

  it "get new by style id and zip" do
    VCR.use_cassette("4Runner_new_tco") do
      data = @edmunds.new_by_style_id_and_zip("101351498","01741")
      refute_nil data["value"]
    end
  end

  it "get used by style id and zip" do
    VCR.use_cassette("4Runner_used_tco") do
      data = @edmunds.used_by_style_id_and_zip("101351498","01741")
      refute_nil data["value"]
    end
  end  

  it "get availabe makes with data" do
    VCR.use_cassette("tco_makes") do
      data = @edmunds.makes_with_data
      refute_nil data["makes"]
      data["makes"]["Acura"]["id"].must_equal 200002038
      data["makes"]["Acura"]["name"].must_equal "Acura"
      data["makes"]["Acura"]["niceName"].must_equal "acura"
    end
  end  

  it "get availabe models with data" do
    make_id = nil
    VCR.use_cassette("tco_makes") do
      make_data = @edmunds.makes_with_data
      make_id = make_data["makes"]["Land Rover"]["id"]
    end
    VCR.use_cassette("tco_models") do
      data = @edmunds.models_with_data( make_id )
      refute_nil data["models"]
      data["models"]["lr2:SUV"]["name"].must_equal "LR2 SUV"
    end
  end

end
