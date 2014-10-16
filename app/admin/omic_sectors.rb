ActiveAdmin.register OmicSector do
  menu :parent => 'Master_tables'

  controller do
    def permitted_params
      params.permit :utf8, :_method, :authenticity_token, :commit, :id,
        omic_sector: [:description, :response_time]
    end
  end
  
  config.comments = false
  
  index do
    selectable_column
    column :id, :sortable => :id do |item|
      link_to item.id, admin_omic_sector_path(item.id)
    end
    column I18n.t("activerecord.attributes.omic_sector.description"), :description
    column I18n.t("activerecord.attributes.omic_sector.response_time"), :response_time
    actions
  end

  filter :description
  filter :response_time
              
  show do
    panel I18n.t("active_admin.details",:model => I18n.t("activerecord.models.omic_sector.one")) do
      attributes_table_for omic_sector do
        row(I18n.t("activerecord.attributes.omic_sector.description")) { omic_sector.description }
        row(I18n.t("activerecord.attributes.omic_sector.response_time")) { omic_sector.response_time }
      end
    end
  end
    
end
