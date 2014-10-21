class OmicResult < ActiveRecord::Base
##  attr_accessible :name, :description
  has_many :omic_claims
  
  validates_presence_of :name, :description;
  
  def display_name
    name.to_s
  end
  
  def to_s
    name.to_s
  end
end
