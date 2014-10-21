class OmicAge < ActiveRecord::Base
##  attr_accessible :description
  has_many :omic_petitioners

  validates_presence_of :description;
    
  def to_s
    description
  end
end
