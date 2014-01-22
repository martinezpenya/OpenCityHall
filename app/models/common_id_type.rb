class CommonIdType < ActiveRecord::Base
  attr_accessible :name
  has_many :omic_petitioners
  has_many :omic_reclaimeds
  
  def to_s
    name
  end
end
