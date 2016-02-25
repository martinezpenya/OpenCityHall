ActiveAdmin.register AccessVisit do
  config.comments = false
  menu :label => proc {I18n.t("activerecord.models.access_visit.other")}, :priority => 1
  
  controller do
    def permitted_params
      params.permit :utf8, 
                    :_method, 
                    :authenticity_token, 
                    :commit, :id,
                     access_visit: [:datetime,
                                    :year,
                                    :common_id_type_id, 
                                    :id_doc, 
                                    :name, 
                                    :motivation, 
                                    :enter_datetime, 
                                    :exit_datetime, 
                                    :admin_user_id]
    end
  end
 
  before_save do |visit|    
    if !visit.admin_user.present? 
      visit.admin_user = AdminUser.find(current_admin_user.id)
    end
    if !visit.year.present?
      visit.year = Time.current.year
    end
    if !visit.datetime.present?
      visit.datetime = Time.current
    end
    visit.enter_datetime = Time.zone.local_to_utc visit.enter_datetime
  end
  
  member_action :exit do
    #claimtoclose = OmicClaim.find(params[:id])
    #claimtoclose.close!
    resource.exit!
    #redirect_to admin_omic_claims_path, :notice => I18n.t("activerecord.models.omic_claim.messages.closed", :omic_claim_id => claimtoclose.id)
    #redirect_to admin_access_visits_path #, :notice => I18n.t("activerecord.models.access_visit.messages.exited", :access_visit_id => resource.id)
    if resource.errors.full_messages.blank?
      redirect_to admin_access_visits_path
    else
      redirect_to admin_access_visits_path, :flash => { :error => resource.errors.full_messages.join(', ') }
    end
  end
 
  batch_action :exit do |selection|
    sep = ""
    stri = ""
    error =""
    AccessVisit.find(selection).each do |visit|
      visit.exit!
      #msg = message_for :result => visit.exit!
      #{ :error => visit.errors.full_messages.join(', ') }
      #stri = "#{stri}#{sep}#{visit.id}"
      error = visit.errors.full_messages.join(', ')
      if !error.blank?
        stri = "#{stri}#{sep}#{'['}#{visit.year}#{'/'}#{visit.id}#{' '}#{']'}#{error}"
        sep= ", "
      end
    end
    if !stri.blank?
      redirect_to :back, :notice => stri
    else
      redirect_to :back
    end
  end
  
  scope :all
  scope :diaactual,  :default => true do |access_visits|
    access_visits.where('datetime = ?', Date.today)
  end
  scope :diaanterior do |access_visits|
    access_visits.where('datetime < ?', Date.today)
  end
  
  index do 
    selectable_column
    column I18n.t("activerecord.models.access_visit.other"), :sortable => :id do |item|
     link_to((item.year.to_s + "/" + item.id.to_s), admin_access_visit_path(item.id))
    end
    column I18n.t("activerecord.attributes.access_visit.datetime"), :sortable => :datetime do |item|
      ( !item.datetime.nil? ? (I18n.l(item.datetime, :format => :short) ) : ("") )
    end
    column I18n.t("activerecord.attributes.access_visit.id_doc"), :sortable => :id_doc do |item|
      item.common_id_type.to_s + " " +item.id_doc
    end
    column I18n.t("activerecord.attributes.access_visit.name"), :sortable => :name do |item|
      item.name
    end
    column I18n.t("activerecord.attributes.access_visit.motivation"), :sortable => :motivation do |item|
      item.motivation
    end
    column I18n.t("activerecord.attributes.access_visit.enter_datetime"), :sortable => :enter_datetime do |item|
      ( !item.enter_datetime.nil? ? (I18n.l(item.enter_datetime.in_time_zone, :format => :short) ) : ("") )
    end
    column I18n.t("activerecord.attributes.access_visit.exit_datetime"), :sortable => :exit_datetime do |item|
      ( !item.exit_datetime.nil? ? (I18n.l(item.exit_datetime.in_time_zone, :format => :short) ) : ("") )
    end
    if current_admin_user.roles.include? "A" then
      #sols si el rol és administrador
      column I18n.t("activerecord.models.admin_user.one"), :sortable => :admin_user_id do |item|
        item.admin_user.name.to_s
      end
    end
    actions do |visit|
      if visit.exit_datetime.blank?
        link_to I18n.t("activerecord.models.access_visit.actions.exit"), exit_admin_access_visit_path(visit)
      end
    end
  end
  
  filter :id
  filter :id_doc
  filter :name
  filter :motivation
  filter :datetime    
  #filter :between_enter_datetime, :as => :time_select
  #filter :exit_datetime
  
  
  show do
    panel I18n.t("active_admin.details",:model => I18n.t("activerecord.models.access_visit.one")) do
      attributes_table_for access_visit do
        row(I18n.t("activerecord.attributes.access_visit.id")) { access_visit.year.to_s + "/" + access_visit.id .to_s}
        row(I18n.t("activerecord.attributes.access_visit.datetime")) { ( !access_visit.datetime.nil? ? (I18n.l(access_visit.datetime, :format => :short) ) : ("") )}
        row(I18n.t("activerecord.attributes.access_visit.id_doc")) { access_visit.common_id_type.to_s + " " + access_visit.id_doc}
        row(I18n.t("activerecord.attributes.access_visit.name")) { access_visit.name}
        row(I18n.t("activerecord.attributes.access_visit.motivation")) { access_visit.motivation}
        row(I18n.t("activerecord.attributes.access_visit.enter_datetime")) { ( !access_visit.enter_datetime.nil? ? (I18n.l(access_visit.enter_datetime.in_time_zone, :format => :short) ) : ("") )}                   
        row(I18n.t("activerecord.attributes.access_visit.exit_datetime")) { ( !access_visit.exit_datetime.nil? ? (I18n.l(access_visit.exit_datetime.in_time_zone, :format => :short) ) : ("") )}
        if current_admin_user.roles.include? "A" then
          #sols si el rol és administrador
          row("created") {(access_visit.created_at)}
          row("updated") {(access_visit.updated_at)}
          row(I18n.t("activerecord.models.admin_user.one")) { (access_visit.admin_user.name.to_s) }
        end
      end
    end
  end
   
  form  do |f|
    f.inputs do    
      if current_admin_user.roles.include? "A" then
        #sols si el rol és administrador
        f.input :datetime, :as => :datepicker, datepicker_options: {dateFormat: "dd/mm/yy" }, :input_html => {:style => 'width: 70px', :value => Date.today.strftime("%d/%m/%Y")} 
      end
      #:just_datetime_picker, :input_html => {:style => 'width: 100px', :value => Date.today}
      f.input :common_id_type, as: :select2, :input_html => {:style => 'width: 90px'}
      f.input :id_doc, :input_html => {:style => 'width: 100px'}
      f.input :name, :input_html => {:style => 'width: 400px'}
      f.input :motivation, :input_html => {:style => 'width: 70%'}
      #f.input :enter_datetime, as: :string, :input_html => { :value => @object.in_time_zone }
      f.input :enter_datetime, :input_html => {:style => 'width: 50px'}
      #sols si el rol és administrador
      if current_admin_user.roles.include? "A" then
        f.input :exit_datetime, :input_html => {:style => 'width: 50px'}
      end
    end
    f.actions
  end 

end
