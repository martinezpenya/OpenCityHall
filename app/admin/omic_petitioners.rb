ActiveAdmin.register OmicPetitioner do
  config.comments = false

  index do
    selectable_column
    column I18n.t("activerecord.attributes.omic_petitioner.id_doc"), :sortable => :id_doc do |item|
      link_to (item.common_id_type.to_s + " " + item.id_doc.to_s), admin_omic_petitioner_path(item.id)
    end 
    column I18n.t("activerecord.attributes.omic_petitioner.firstname"), :firstname do |item|
      ( !item.firstname.nil? ? ( item.firstname.to_s) : ("") )
    end
    column I18n.t("activerecord.attributes.omic_petitioner.surname1"), :surname1 do |item|
      ( !item.surname1.nil? ? ( item.surname1.to_s) : ("") )
    end
    column I18n.t("activerecord.attributes.omic_petitioner.surname2"), :surname2 do |item|
      ( !item.surname2.nil? ? ( item.surname2.to_s) : ("") )
    end
    column I18n.t("activerecord.attributes.omic_petitioner.phone1"), :phone1 do |item|
      ( !item.phone1.nil? ? ( item.phone1.to_s) : ("") )
    end
    column I18n.t("activerecord.attributes.omic_petitioner.phone2"), :phone2 do |item|
      ( !item.phone2.nil? ? ( item.phone2.to_s) : ("") )
    end
    column I18n.t("activerecord.attributes.omic_petitioner.email"), :sortable => :email do |item|
      link_to item.email, "mailto:"+item.email
    end
    actions
  end
  
  filter :id_doc
  filter :firstname
  filter :surname1
  filter :surname2
  filter :notes

  show do
    panel I18n.t("active_admin.details",:model => I18n.t("activerecord.models.omic_petitioner.one")) do
      attributes_table_for omic_petitioner do
        row(I18n.t("activerecord.attributes.omic_petitioner.firstname")) { omic_petitioner.firstname}
        row(I18n.t("activerecord.attributes.omic_petitioner.surname1")) { omic_petitioner.surname1}
        row(I18n.t("activerecord.attributes.omic_petitioner.surname2")) { omic_petitioner.surname2}
        row(I18n.t("activerecord.attributes.omic_petitioner.id_doc")) { omic_petitioner.common_id_type.to_s + " " + omic_petitioner.id_doc.to_s }     
        row(I18n.t("activerecord.attributes.omic_petitioner.address")) { omic_petitioner.address}
        row(I18n.t("activerecord.attributes.omic_petitioner.cp")) { omic_petitioner.cp}
        row(I18n.t("activerecord.attributes.omic_petitioner.town")) { omic_petitioner.town}
        row(I18n.t("activerecord.attributes.omic_petitioner.province")) { omic_petitioner.province}
        row(I18n.t("activerecord.attributes.omic_petitioner.phone1")) { omic_petitioner.phone1}
        row(I18n.t("activerecord.attributes.omic_petitioner.phone2")) { omic_petitioner.phone2}
        row(I18n.t("activerecord.attributes.omic_petitioner.email")) { omic_petitioner.email}
        row(I18n.t("activerecord.attributes.omic_petitioner.notes")) { omic_petitioner.notes}
        row(I18n.t("activerecord.attributes.omic_petitioner.sex")) { status_tag (omic_petitioner.sex ? "Home" : "Dona"), (omic_petitioner.sex ? :ok : :error) }     
        row(I18n.t("activerecord.models.omic_age.one")) { !omic_petitioner.omic_age.nil? ? ( link_to omic_petitioner.omic_age.description, admin_omic_age_path(omic_petitioner.omic_age) ) : ("") }       
      end
    end
  end
  
  sidebar "Other claims for this Petitioner", :only => :show do
    table_for omic_petitioner.omic_claims do |c|
      c.column("id") { |claim| link_to claim.display_name, admin_omic_claim_path(claim) }
      c.column("Status") { |claim| status_tag (claim.open ? "Open" : "closed"), (claim.open ? :ok : :error) }
      c.column("Title") { |claim| link_to claim.omic_reclaimed.to_s, admin_omic_reclaimed_path(claim.omic_reclaimed) }
    end
  end

  form  do |f|
    f.inputs do
      f.input :firstname
      f.input :surname1
      f.input :surname2
      f.input :common_id_type, :input_html => {:style => 'width: 150px', :class => 'select2able' }
      f.input :id_doc, :input_html => { :maxlength => 10  }
      f.input :address
      f.input :cp
      f.input :town
      f.input :province
      f.input :phone1
      f.input :phone2
      f.input :email
      f.input :notes
      f.input :sex, :as => :select, collection: [['Home', 'true'], ['Dona', 'false']], :input_html => {:style => 'width: 150px', :class => 'select2able' }
      f.input :omic_age, :input_html => {:style => 'width: 150px', :class => 'select2able' }
    end
    f.actions
  end 

end
