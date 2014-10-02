ActiveAdmin.register OmicQuery do 
  config.comments = false
  
  before_save do |query|
    if !query.admin_user.present? 
      query.admin_user = AdminUser.find(current_admin_user.id)
    end
  end
    
  member_action :close do
    #query = OmicQuery.find(params[:id])
    #query.close!
    resource.close!
    #redirect_to admin_omic_queries_path, :notice => I18n.t("activerecord.models.omic_query.messages.closed", :omic_query_id => query.id)
    redirect_to admin_omic_queries_path, :notice => I18n.t("activerecord.models.omic_query.messages.closed", :omic_query_id => query.id)
  end

  action_item :only => :show do
    query = OmicQuery.find(params[:id])
    link_to(I18n.t("activerecord.models.omic_query.actions.close"), close_admin_omic_query_path(query)) if query.open?
  end
  
  batch_action :close do |selection|
    sep = ""
    stri = ""
    OmicQuery.find(selection).each do |query|
      query.close!
      stri = "#{stri}#{sep}#{query.id}"
      sep= ", "
    end
    redirect_to admin_omic_queries_path, :notice => I18n.t("activerecord.models.omic_query.messages.closed", :omic_query_id => stri)
  end
  
  scope :all, :default => true
  scope :open do |omic_queries|
    omic_queries.where('open = ?', true)
  end
  scope :closed do |omic_queries|
    omic_queries.where('open = ?', false)
  end
  
  index do
    selectable_column
    column :id, :sortable => :id do |item|
      link_to item.id, admin_omic_query_path(item.id)
    end
    column I18n.t("activerecord.attributes.omic_query.datetime"), :sortable => :datetime do |item|
      I18n.l(item.datetime, :format => :short)
    end
    column I18n.t("activerecord.attributes.omic_query.notes"), :notes
    column I18n.t("activerecord.models.omic_sector.one"), :sortable => :omic_sector do |item|
      (!item.omic_sector.nil? ? ( link_to item.omic_sector.description, admin_omic_sector_path(item.omic_sector) ) : ("") )
    end
    column I18n.t("activerecord.models.omic_service.one"), :sortable => :omic_service do |item|
      ( !item.omic_service.nil? ? ( link_to item.omic_service.name, admin_omic_service_path(item.omic_service) ) : ("") )
    end
    column I18n.t("activerecord.models.omic_reason.one"), :sortable => :omic_reason do |item|
      ( !item.omic_reason.nil? ? ( link_to item.omic_reason.name, admin_omic_reason_path(item.omic_reason) ) : ("") ) 
    end
    column I18n.t("activerecord.attributes.omic_query.open"), :sortable => :open do |item| 
      status_tag((item.open ? I18n.t("custom.state.female.open", :count => 1) : I18n.t("custom.state.female.closed", :count => 1)), (item.open ? :ok : :error))
    end
    actions do |query|
      if query.open?
        link_to I18n.t("activerecord.models.omic_query.actions.close"), close_admin_omic_query_path(query)
      end
    end
  end
  
  filter :id
  filter :datetime
  filter :omic_sector
  filter :omic_service
  filter :omic_reason
  filter :omic_mean
  filter :notes
  filter :open
  
  show do
    panel I18n.t("active_admin.details",:model => I18n.t("activerecord.models.omic_query.one")) do
      attributes_table_for omic_query do
        row(I18n.t("activerecord.attributes.omic_query.datetime")) { omic_query.datetime}
        row(I18n.t("activerecord.attributes.omic_query.notes")) { omic_query.notes }
        row(I18n.t("activerecord.models.omic_sector.one")) { !omic_query.omic_sector.nil? ? ( link_to omic_query.omic_sector.description, admin_omic_sector_path(omic_query.omic_sector) ) : ("") }
        row(I18n.t("activerecord.models.omic_service.one")) { !omic_query.omic_service.nil? ? ( link_to omic_query.omic_service.description, admin_omic_service_path(omic_query.omic_service) ) : ("") }
        row(I18n.t("activerecord.models.omic_reason.one")) { !omic_query.omic_reason.nil? ? ( link_to omic_query.omic_reason.description, admin_omic_reason_path(omic_query.omic_reason) ) : ("") }       
        row(I18n.t("activerecord.models.omic_mean.one")) { !omic_query.omic_mean.nil? ? ( link_to omic_query.omic_mean.description, admin_omic_mean_path(omic_query.omic_mean) ) : ("") }       
        row(I18n.t("activerecord.attributes.omic_query.open")) { status_tag((omic_query.open ? "Obert" : "Tancat"), (omic_query.open ? :ok : :error)) }     
      end
    end
  end
  
  form  do |f|
    f.inputs do
      f.input :datetime, :as => :datepicker, :input_html => {:style => 'width: 100px'}
      f.input :omic_sector, :as => :select2, :input_html => {:style => 'width: 250px'}
      f.input :omic_service, :as => :select2, :input_html => {:style => 'width: 250px'}
      f.input :notes
      f.input :omic_reason, :as => :select2, :input_html => {:style => 'width: 350px'}
      f.input :omic_mean, :as => :select2, :input_html => {:style => 'width: 350px'}
      f.input :open, :as => :select2, collection: [['Si', 'true'], ['No', 'false']], :input_html => {:style => 'width: 100px'}
      f.input :admin_user, :as => :select2, :input_html => {:style => 'width: 250px'}
      ### chosen and select2 samples
      #      f.input :omic_sector, :input_html =>  {  :class => 'chzn-select', :width => 'auto', "data-placeholder" => 'Click' }
      #      f.input :omic_reason, :input_html => { :multiple => 'true', :style => 'width: 76%'}
    end
    f.actions
  end 
  
end
