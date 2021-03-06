class OmicClaim < ActiveRecord::Base

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

  validates_presence_of :datetime, :omic_petitioner, :omic_reclaimed, :omic_sector, :omic_mean, :omic_reason, :documents, :facts, :pretensions, :omic_situation, :omic_result, :presence => true
  validates_inclusion_of :open, in: [true, false]
  
  def close!
    self.open=false
    self.save
  end
  
  def display_name
    year.to_s + "/" + id.to_s 
  end
end