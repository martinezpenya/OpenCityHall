ActiveAdmin.register OmicReclaimed do
    #menu :parent => I18n.t("menu.master_tables")
  config.comments = false
  
  index do
    selectable_column
    column I18n.t("activerecord.attributes.omic_reclaimed.id_doc"), :sortable => :id_doc do |item|
      link_to((item.common_id_type.to_s + " " + item.id_doc.to_s), admin_omic_reclaimed_path(item.id))
    end 
    column I18n.t("activerecord.attributes.omic_reclaimed.social_name"), :social_name
    column I18n.t("activerecord.attributes.omic_reclaimed.comercial_name"), :comercial_name
    column I18n.t("activerecord.attributes.omic_reclaimed.phone1"), :phone1
    column I18n.t("activerecord.attributes.omic_reclaimed.phone2"), :phone2
    column I18n.t("activerecord.attributes.omic_reclaimed.fax"), :fax
    column I18n.t("activerecord.attributes.omic_reclaimed.email"), :sortable => :email do |item|
      link_to item.email, "mailto:"+item.email
    end
    actions
  end
  
  filter :id_doc
  filter :social_name
  filter :notes
  
    show do
    panel I18n.t("active_admin.details",:model => I18n.t("activerecord.models.omic_reclaimed.one")) do
      attributes_table_for omic_reclaimed do
        row(I18n.t("activerecord.attributes.omic_reclaimed.social_name")) { omic_reclaimed.social_name}
        row(I18n.t("activerecord.attributes.omic_reclaimed.comercial_name")) { omic_reclaimed.comercial_name}
        row(I18n.t("activerecord.attributes.omic_reclaimed.id_doc")) { omic_reclaimed.common_id_type.to_s + " " + omic_reclaimed.id_doc.to_s }     
        row(I18n.t("activerecord.attributes.omic_reclaimed.address")) { omic_reclaimed.address}
        row(I18n.t("activerecord.attributes.omic_reclaimed.cp")) { omic_reclaimed.cp}
        row(I18n.t("activerecord.attributes.omic_reclaimed.town")) { omic_reclaimed.town}
        row(I18n.t("activerecord.attributes.omic_reclaimed.province")) { omic_reclaimed.province}
        row(I18n.t("activerecord.attributes.omic_reclaimed.phone1")) { omic_reclaimed.phone1}
        row(I18n.t("activerecord.attributes.omic_reclaimed.phone2")) { omic_reclaimed.phone2}
        row(I18n.t("activerecord.attributes.omic_reclaimed.fax")) { omic_reclaimed.fax}
        row(I18n.t("activerecord.attributes.omic_reclaimed.email")) { omic_reclaimed.email}
        row(I18n.t("activerecord.attributes.omic_reclaimed.notes")) { omic_reclaimed.notes}
      end
    end
  end
  
  sidebar "Other claims for this Reclaimed", :only => :show do
    table_for omic_reclaimed.omic_claims do |c|
      c.column("id") { |claim| link_to claim.display_name, admin_omic_claim_path(claim) }
      c.column("Status") { |claim| status_tag((claim.open ? "Open" : "closed"), (claim.open ? :ok : :error)) }
      c.column("Title") { |claim| link_to claim.omic_petitioner.to_s, admin_omic_petitioner_path(claim.omic_petitioner) }
    end
  end
  
  form  do |f|
    f.inputs do
      f.input :social_name
      f.input :comercial_name
      f.input :common_id_type, :as => :select2, :input_html => {:style => 'width: 150px'}
      f.input :id_doc, :input_html => { :maxlength => 10  }
      f.input :address
      f.input :cp
      f.input :town
      f.input :province
      f.input :phone1
      f.input :phone2
      f.input :fax
      f.input :email
      f.input :notes
    end
    f.actions
  end 

end