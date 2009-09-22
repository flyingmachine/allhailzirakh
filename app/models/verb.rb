class Verb < ActiveRecord::Base
  is_taggable
  acts_as_solr
  
  validates_presence_of :command
  after_validation :extract_name
  
  
  def extract_name
    self.name = self.command.to_s.match(/\S+/)[0]
  end
  
end
