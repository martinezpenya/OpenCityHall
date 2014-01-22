ActiveAdmin.register OmicReason do
  menu :parent => I18n.t("menu.master_tables")
  config.comments = false
  
  index do
    selectable_column
    column :id, :sortable => :id do |item|
      link_to item.id, admin_omic_reason_path(item.id)
    end
    column I18n.t("activerecord.attributes.omic_reason.description"), :description
    actions
  end

  filter :description
              
  show do
    panel I18n.t("active_admin.details",:model => I18n.t("activerecord.models.omic_reason.one")) do
      attributes_table_for omic_reason do
        row(I18n.t("activerecord.attributes.omic_reason.description")) { omic_reason.description }
      end
    end
  end
    
end
