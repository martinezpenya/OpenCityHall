class OmicSituation < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :omic_queries
  
  def display_name
    name
  end
  
  def to_s
    name
  end
end