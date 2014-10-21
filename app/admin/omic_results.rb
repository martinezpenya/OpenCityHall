ActiveAdmin.register OmicResult do
  menu :parent => 'Master_tables'

  controller do
    def permitted_params
      params.permit :utf8, :_method, :authenticity_token, :commit, :id,
        omic_result: [:name, :description]
    end
  end
  
  config.comments = false
  
  index do
    selectable_column
    column :id, :sortable => :id do |item|
      link_to item.id, admin_omic_result_path(item.id)
    end
    column I18n.t("activerecord.attributes.omic_result.name"), :name
    column I18n.t("activerecord.attributes.omic_result.description"), :description
    actions
  end

  filter :name 
  filter :description
              
  show do
    panel I18n.t("active_admin.details",:model => I18n.t("activerecord.models.omic_result.one")) do
      attributes_table_for omic_result do
        row(I18n.t("activerecord.attributes.omic_result.name")) { omic_result.name }
        row(I18n.t("activerecord.attributes.omic_result.description")) { omic_result.description }
      end
    end
  end
    
end
