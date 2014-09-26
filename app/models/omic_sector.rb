class OmicSector < ActiveRecord::Base
##  attr_accessible :description, :response_time
  has_many :omic_queries
  has_many :omic_claims
   
  def display_name
    description
  end

  def to_s
    description
  end
end
