class Verb < ActiveRecord::Base
  
  before_validation :extract_name
  
  def extract_name
    self.name = command.match(/\S+/)[0]
  end
  
end
