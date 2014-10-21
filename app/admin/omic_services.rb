ActiveAdmin.register OmicService do
  menu :parent => 'Master_tables'

  controller do
    def permitted_params
      params.permit :utf8, :_method, :authenticity_token, :commit, :id,
        omic_service: [:description, :name]
    end
  end
  
  config.comments = false
  
  index do
    selectable_column
    column :id, :sortable => :id do |item|
      link_to item.id, admin_omic_service_path(item.id)
    end
    column I18n.t("activerecord.attributes.omic_service.name"), :name
    column I18n.t("activerecord.attributes.omic_service.description"), :description
    actions
  end

  filter :name 
  filter :description
              
  show do
    panel I18n.t("active_admin.details",:model => I18n.t("activerecord.models.omic_service.one")) do
      attributes_table_for omic_service do
        row(I18n.t("activerecord.attributes.omic_service.name")) { omic_service.name }
        row(I18n.t("activerecord.attributes.omic_service.description")) { omic_service.description }
      end
    end
  end
    
end