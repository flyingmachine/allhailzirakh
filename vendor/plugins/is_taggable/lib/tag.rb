class Tag < ActiveRecord::Base
  class << self
    def find_or_initialize_with_name_like_and_kind(name, kind)
      with_name_like_and_kind(name, kind).first || new(:name => name, :kind => kind)
    end
  end

  has_many :taggings, :dependent => :destroy

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :kind
  before_validation :format

  named_scope :with_name_like_and_kind, lambda { |name, kind| { :conditions => ["name like ? AND kind = ?", name, kind] } }
  named_scope :of_kind,                 lambda { |kind| { :conditions => {:kind => kind} } }
  
  def format
    self.name = self.name.downcase
    
    match = (Races + Guilds).detect{|k| 
      name == k.downcase
    }
    self.name = match if match
  end
end
