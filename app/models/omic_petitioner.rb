class OmicPetitioner < ActiveRecord::Base
  attr_accessible :common_id_type_id, :id_doc, :firstname, :surname1, :surname2, :address, :cp, :town, :province, :phone1, :phone2, :email, :notes, :sex, :omic_age_id
  has_many :omic_claims
  belongs_to :common_id_type
  belongs_to :omic_age
    
  def display_name
    self.firstname.to_s + " "+ surname1.to_s + " " + surname2.to_s + " (" + common_id_type.to_s + " " + id_doc.to_s + ")"
  end

  def to_s
    firstname.to_s + " "+ surname1.to_s + " " + surname2.to_s + " (" + common_id_type.to_s + " " + id_doc.to_s + ")"
  end
end
