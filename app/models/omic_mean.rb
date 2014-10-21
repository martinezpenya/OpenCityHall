class OmicMean < ActiveRecord::Base
##  attr_accessible :description
  has_many :omic_claims
  
  validates_presence_of :description;
    
  def display_name
    description.to_s
  end
  
#  def to_s
#    description
#  end
end
