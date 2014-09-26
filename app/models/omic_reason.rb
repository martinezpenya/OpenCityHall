class OmicReason < ActiveRecord::Base
##  attr_accessible :description, :name
  has_many :omic_queries
  has_many :omic_claims
  
  def display_name
    name.to_s
  end

end
