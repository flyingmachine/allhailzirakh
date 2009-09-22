class Verb < ActiveRecord::Base
  is_taggable
  
  validates_presence_of :command
  after_validation :extract_name
  
  cattr_reader :per_page
  @@per_page = 20

  
  def extract_name
    self.name = self.command.to_s.match(/\S+/)[0]
  end
  
end
