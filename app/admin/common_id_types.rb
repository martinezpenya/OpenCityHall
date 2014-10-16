ActiveAdmin.register CommonIdType do
  menu :parent => 'Master_tables'
  
  controller do
    def permitted_params
      params.permit :utf8, :_method, :authenticity_token, :commit, :id,
        common_id_type: [:name]
    end
  end
  
  config.comments = false
  
  index do
    selectable_column
    column :id, :sortable => :id do |item|
      link_to item.id, admin_common_id_type_path(item.id)
    end
    column I18n.t("activerecord.attributes.common_id_type.name"), :name
    actions
  end

  filter :name
              
  show do
    panel I18n.t("active_admin.details",:model => I18n.t("activerecord.models.common_id_type.one")) do
      attributes_table_for common_id_type do
        row(I18n.t("activerecord.attributes.common_id_type.name")) { common_id_type.name }
      end
    end
  end
    
end
