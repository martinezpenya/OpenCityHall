ActiveAdmin.register OmicSituation  do
  menu :parent => 'Master_tables'

  controller do
    def permitted_params
      params.permit :utf8, :_method, :authenticity_token, :commit, :id,
        omic_situation: [:description, :name]
    end
  end
  
  config.comments = false
  config.sort_order ="id_asc"
  index do
    selectable_column
    column :id, :sortable => :id do |item|
      link_to item.id, admin_omic_situation_path(item.id)
    end
    column I18n.t("activerecord.attributes.omic_situation.name"), :name
    column I18n.t("activerecord.attributes.omic_situation.description"), :description
    actions
  end

  filter :name 
  filter :description
              
  show do
    panel I18n.t("active_admin.details",:model => I18n.t("activerecord.models.omic_situation.one")) do
      attributes_table_for omic_situation do
        row(I18n.t("activerecord.attributes.omic_situation.name")) { omic_situation.name }
        row(I18n.t("activerecord.attributes.omic_situation.description")) { omic_situation.description }
      end
    end
  end
  
  form  do |f|
    f.inputs do
      f.input :name
      f.input :description
    end
    f.actions
  end    
    
end