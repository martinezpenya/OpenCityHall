class CommonIdType < ActiveRecord::Base
##  attr_accessible :name
  has_many :omic_petitioners
  has_many :omic_reclaimeds
  has_many :access_visits
  
  validates_presence_of :name;

  def to_s
    name
  end
end
