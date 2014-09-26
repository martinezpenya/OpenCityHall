class OmicReclaimed < ActiveRecord::Base
##  attr_accessible :address, :common_id_type_id, :cp, :id_doc, :email, :fax, :notes, :phone1, :phone2, :province, :social_name, :comercial_name, :town
  has_many :omic_claims
  belongs_to :common_id_type

  accepts_nested_attributes_for :common_id_type

  def display_name
    social_name.to_s + " (" + common_id_type.to_s + " " + id_doc.to_s + ")"
  end

  def to_s
    social_name.to_s + " (" + common_id_type.to_s + " " + id_doc.to_s + ")"
  end
end
