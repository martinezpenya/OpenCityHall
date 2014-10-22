class OmicQuery < ActiveRecord::Base
##  attr_accessible :datetime, :notes, :open, :omic_sector_id, :omic_service_id, :omic_reason_id, :admin_user_id
  belongs_to :omic_sector
  belongs_to :omic_service
  belongs_to :omic_reason
  belongs_to :omic_mean
  belongs_to :admin_user
  
  accepts_nested_attributes_for :omic_sector
  accepts_nested_attributes_for :omic_service
  accepts_nested_attributes_for :omic_reason 
  accepts_nested_attributes_for :omic_mean
  accepts_nested_attributes_for :admin_user
  
  validates_presence_of :datetime, :notes, :omic_sector, :omic_service, :omic_reason, :omic_mean, :admin_user, :open
  
  #def close!(query)
  #  query_to_close=OmicQuery.find(query)
  #  query_to_close.open=false
  #  query_to_close.save
  #end
  
  def close!
    self.open=false
    self.save
  end

  def to_s
    self.id.to_s
  end
end
