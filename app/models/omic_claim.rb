class OmicClaim < ActiveRecord::Base
##  attr_accessible :datetime, :documents, :facts, :notes, :pretensions, :year, :open, :admin_user_id, :omic_sector_id, :omic_mean_id, :omic_reason_id, :omic_situation_id, :omic_petitioner_id, :omic_petitioner_attributes, :omic_reclaimed_id, :omic_result_id
  belongs_to :omic_petitioner
  belongs_to :omic_reclaimed
  belongs_to :omic_result
  belongs_to :admin_user
  belongs_to :omic_sector
  belongs_to :omic_mean
  belongs_to :omic_reason
  belongs_to :omic_situation
  
  accepts_nested_attributes_for :omic_petitioner, :reject_if => :all_blank
  accepts_nested_attributes_for :omic_reclaimed, :reject_if => :all_blank
  #accepts_nested_attributes_for :admin_user
  #accepts_nested_attributes_for :omic_sector
  #accepts_nested_attributes_for :omic_reason  
  
  #validates :year, :datetime, :admin_user, :presence => true
  
  def close!
    self.open=false
    self.save
  end
  
  def display_name
    year.to_s + "/" + id.to_s 
  end
end