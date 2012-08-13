module EdmundsCars::Photos
  API = "vehiclephoto/service"
  
  class NonExistentCategory < EdmundsCars::EdmundsApiError;  end
  class << self
    
    VALID_PHOTO_CATEGORIES = %w( interior exterior )
    def find_by_style_id(style_id)
      EdmundsCars.get_edmunds_data API, "findphotosbystyleid", {:styleId => style_id}
    end
    
    def find_all_urls(style_id)
      data = find_by_style_id( style_id )
      
      partial_urls = data.collect{|x|  x['photoSrcs']}.flatten
      partial_urls.collect{|partial_url| EdmundsCars::BASE_MEDIA_URI + partial_url}
    end
    
    def find_urls_by_category(style_id, category)
      raise NonExistentCategory unless VALID_PHOTO_CATEGORIES.include? category
      data = find_by_style_id( style_id )
      partial_urls = data.select{|x| x["subType"] == "interior"}.collect{|x| x["photoSrcs"]}.flatten
      partial_urls.collect{|partial_url| EdmundsCars::BASE_MEDIA_URI + partial_url}
    end
  end
  
end
  
