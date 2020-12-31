class Repo 
  attr_reader :id, 
              :name, 
              :private, 
              :html_url, 
              :created_at, 
              :updated_at 

  def initialize(json)
    @id = json[:id]    
    @name = json[:name]    
    @private = json[:private]    
    @html_url = json[:html_url]    
    @created_at = json[:created_at]    
    @updated_at = json[:updated_at]    
  end
end
