class OmicAge < ActiveRecord::Base
##  attr_accessible :description
  has_many :omic_petitioners
  
  def to_s
    description
  end
end
