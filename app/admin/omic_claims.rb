include ActionView::Helpers::NumberHelper

  def generate_claim_ofici(claim)
    # Generate ofici claim
    report = ODFReport::Report.new("#{Rails.root}/app/odt_templates/OmicClaim_Ofici_#{I18n.locale}.odt") do |odt|
      ##Reclaimed
      odt.add_field(:SOCIAL_NAME, @claim.omic_reclaimed.social_name.to_s)
      odt.add_field(:ADDRESS, @claim.omic_reclaimed.address.to_s)
      odt.add_field(:CP, @claim.omic_reclaimed.cp.to_s)
      odt.add_field(:TOWN, @claim.omic_reclaimed.town.to_s)
      odt.add_field(:PROVINCE, @claim.omic_reclaimed.province.to_s)
      odt.add_field(:INITIALS, @claim.admin_user.initials.to_s)
      
      ##Year/ID
      odt.add_field(:YEAR, @claim.year.to_s)
      odt.add_field(:ID, @claim.id.to_s)
      odt.add_field(:INITIALS, @claim.admin_user.initials.to_s)
      
      ##Body
      odt.add_field(:DATETIME, I18n.l(@claim.datetime, :format => :short))
      odt.add_field(:FIRSTNAME, @claim.omic_petitioner.firstname.to_s)
      odt.add_field(:SURNAME1, @claim.omic_petitioner.surname1.to_s)
      odt.add_field(:SURNAME2, @claim.omic_petitioner.surname2.to_s)
      odt.add_field(:RESPONSE_TIME, I18n.t("datetime.distance_in_words.x_months", :count => @claim.omic_sector.response_time))
      
      ##Signature
      odt.add_field(:REGIDOR, Settings.regidor)
      
      report_file_name = odt.generate
      send_file(report_file_name)
    end
  end
  
  def generate_claim_reclamacio(claim)
    # Generate ofici claim
    report = ODFReport::Report.new("#{Rails.root}/app/odt_templates/OmicClaim_Reclamacio_#{I18n.locale}.odt") do |odt|
      ##Year/ID
      odt.add_field(:YEAR, @claim.year.to_s)
      odt.add_field(:ID, @claim.id.to_s)
      odt.add_field(:DATE, I18n.l(@claim.datetime, :format => :short))
      odt.add_field(:USER, @claim.admin_user.name.to_s)    
  
      ##Petitioner
      odt.add_field(:PETITIONER_NAME, @claim.omic_petitioner.firstname.to_s)
      odt.add_field(:PETITIONER_SURNAME1, @claim.omic_petitioner.surname1.to_s)
      odt.add_field(:PETITIONER_SURNAME2, @claim.omic_petitioner.surname2.to_s)
      odt.add_field(:PETITIONER_COMMON_ID_TYPE, @claim.omic_petitioner.common_id_type.name.to_s)
      odt.add_field(:PETITIONER_ID_DOC, @claim.omic_petitioner.id_doc.to_s)
      odt.add_field(:PETITIONER_ADDRESS, @claim.omic_petitioner.address.to_s)
      odt.add_field(:PETITIONER_CP, @claim.omic_petitioner.cp.to_s)
      odt.add_field(:PETITIONER_TOWN, @claim.omic_petitioner.town.to_s)
      odt.add_field(:PETITIONER_PROVINCE, @claim.omic_petitioner.province.to_s)
      odt.add_field(:PETITIONER_PHONE1, @claim.omic_petitioner.phone1.to_s)
      odt.add_field(:PETITIONER_PHONE2, @claim.omic_petitioner.phone2.to_s)
      odt.add_field(:PETITIONER_EMAIL, @claim.omic_petitioner.email.to_s)
      
      ##Reclaimed
      odt.add_field(:RECLAIMED_SOCIAL_NAME, @claim.omic_reclaimed.social_name.to_s)
      odt.add_field(:RECLAIMED_COMERCIAL_NAME, @claim.omic_reclaimed.comercial_name.to_s)
      odt.add_field(:RECLAIMED_COMMON_ID_TYPE, @claim.omic_reclaimed.common_id_type.name.to_s)
      odt.add_field(:RECLAIMED_ID_DOC, @claim.omic_reclaimed.id_doc.to_s)
      odt.add_field(:RECLAIMED_ADDRESS, @claim.omic_reclaimed.address.to_s)
      odt.add_field(:RECLAIMED_CP, @claim.omic_reclaimed.cp.to_s)
      odt.add_field(:RECLAIMED_TOWN, @claim.omic_reclaimed.town.to_s)
      odt.add_field(:RECLAIMED_PROVINCE, @claim.omic_reclaimed.province.to_s)
      odt.add_field(:RECLAIMED_PHONE1, @claim.omic_reclaimed.phone1.to_s)
      odt.add_field(:RECLAIMED_PHONE2, @claim.omic_reclaimed.phone2.to_s)
      odt.add_field(:RECLAIMED_FAX, @claim.omic_reclaimed.fax.to_s)
      odt.add_field(:RECLAIMED_EMAIL, @claim.omic_reclaimed.email.to_s)
      
      ##Facts
      odt.add_field(:FACTS, @claim.facts)
  
      ##Petition
      odt.add_field(:PRETENSIONS, @claim.pretensions)
      
      ##Documents
      odt.add_field(:DOCUMENTS, @claim.documents)
      
      ##Signature
      odt.add_field(:REGIDOR, Settings.regidor)
      
      report_file_name = odt.generate
      send_file(report_file_name)
    end
  end

ActiveAdmin.register OmicClaim do
  config.comments = false

  before_save do |claim|
    if !claim.admin_user.present? 
      claim.admin_user = AdminUser.find(current_admin_user.id)
    end
    if !claim.year.present?
      claim.year = Time.now.year
    end
    if !claim.open.present?
      claim.open = true
    end
  end

  member_action :close do
    #claimtoclose = OmicClaim.find(params[:id])
    #claimtoclose.close!
    resource.close!
    #redirect_to admin_omic_claims_path, :notice => I18n.t("activerecord.models.omic_claim.messages.closed", :omic_claim_id => claimtoclose.id)
    redirect_to admin_omic_claims_path, :notice => I18n.t("activerecord.models.omic_claim.messages.closed", :omic_claim_id => resource.id)
  end

  member_action :generate_ofici_odt do
    @claim = OmicClaim.find(params[:id])
    generate_claim_ofici(@claim)
  end

  member_action :generate_reclamacio_odt do
    @claim = OmicClaim.find(params[:id])
    generate_claim_reclamacio(@claim)
  end

  action_item :only => [:show] do
    link_to I18n.t("activerecord.models.omic_claim.actions.reclamacio"), generate_reclamacio_odt_admin_omic_claim_path(resource)
  end
  
  action_item :only => [:show] do
    link_to I18n.t("activerecord.models.omic_claim.actions.ofici"), generate_ofici_odt_admin_omic_claim_path(resource)
  end
  
  action_item :only => [:show] do
    claim = OmicClaim.find(params[:id])
    link_to(I18n.t("activerecord.models.omic_claim.actions.close"), close_admin_omic_claim_path(resource)) if claim.open?
  end
  
  batch_action :close do |selection|
    sep = ""
    stri = ""
    OmicClaim.find(selection).each do |claim|
      claim.close!
      stri = "#{stri}#{sep}#{claim.id}"
      sep= ", "
    end
    redirect_to admin_omics_claim_path, :notice => I18n.t("activerecord.models.omic_claim.messages.closed", :omic_claim_id => stri)
  end
  
  scope :all
  scope :anyactual,  :default => true do |omic_claims|
    omic_claims.where('year = ?', Time.now.year)
  end
  scope :anyanterior do |omic_claims|
    omic_claims.where('year = ?', Time.now.year-1)
  end
  
  index do
    selectable_column
    column I18n.t("activerecord.models.omic_claim.other"), :sortable => :id do |item|
     link_to((item.year.to_s + "/" + item.id.to_s), admin_omic_claim_path(item.id))
    end
    column I18n.t("activerecord.attributes.omic_claim.datetime"), :sortable => :datetime do |item|
      I18n.l(item.datetime, :format => :short)
    end
    column I18n.t("activerecord.models.omic_petitioner.one"), :sortable => :omic_petitioner.to_s do |item|
      ( !item.omic_petitioner.nil? ? ( link_to item.omic_petitioner.to_s, admin_omic_petitioner_path(item.omic_petitioner_id) ) : ("") )
    end
    column I18n.t("activerecord.models.omic_reclaimed.one"), :sortable => :omic_reclaimed.to_s do |item|
      ( !item.omic_reclaimed.nil? ? ( link_to item.omic_reclaimed.to_s, admin_omic_reclaimed_path(item.omic_reclaimed) ) : ("") )
    end
    column I18n.t("activerecord.attributes.omic_claim.facts") do |item|
      raw("<pan title='#{item.facts}'> #{truncate(item.facts, omision: "...", length: 250)} </span>") 
    end
    column I18n.t("activerecord.models.omic_situation.one"), :sortable => :omic_situation do |item|
      ( !item.omic_situation.nil? ? ( link_to item.omic_situation.to_s, admin_omic_situation_path(item.omic_situation) ) : ("") )
    end
    column I18n.t("activerecord.models.omic_result.one"), :sortable => :omic_result do |item|
      ( !item.omic_result.nil? ? ( link_to item.omic_result.to_s, admin_omic_result_path(item.omic_result) ) : ("") )
    end
    column I18n.t("activerecord.attributes.omic_claim.open"), :sortable => :open do |item| 
      status_tag((item.open ? I18n.t("custom.state.female.open", :count => 1) : I18n.t("custom.state.female.closed", :count => 1)), (item.open ? :ok : :error))
    end
    actions do |claim|
      if claim.open?
        link_to I18n.t("activerecord.models.omic_claim.actions.close"), close_admin_omic_claim_path(claim)
      end
    end
  end
  
  filter :id
  filter :datetime
  filter :omic_petitioner, :input_html => {:class => 'select2able' }
  filter :omic_reclaimed, :input_html => {:class => 'select2able' }
  filter :omic_resultat, :input_html => {:class => 'select2able' }
  filter :open
  filter :notes
  
  show do
    panel I18n.t("active_admin.details",:model => I18n.t("activerecord.models.omic_claim.one")) do
      attributes_table_for omic_claim do
        #row(I18n.t("activerecord.attributes.omic_claim.year")) { omic_claim.year}
        row(I18n.t("activerecord.attributes.omic_claim.datetime")) { omic_claim.datetime}
        row(I18n.t("activerecord.models.omic_petitioner.one")) { omic_claim.omic_petitioner}
        row(I18n.t("activerecord.models.omic_reclaimed.one")) { omic_claim.omic_reclaimed}     
        row(I18n.t("activerecord.models.omic_sector.one")) { omic_claim.omic_sector}     
        row(I18n.t("activerecord.models.omic_mean.one")) { omic_claim.omic_mean}     
        row(I18n.t("activerecord.models.omic_reason.one")) { omic_claim.omic_reason}     
        row(I18n.t("activerecord.attributes.omic_claim.facts")) { omic_claim.facts}
        row(I18n.t("activerecord.attributes.omic_claim.pretensions")) { omic_claim.pretensions}
        row(I18n.t("activerecord.attributes.omic_claim.documents")) { omic_claim.documents}
        row(I18n.t("activerecord.attributes.omic_claim.notes")) { omic_claim.notes}
        row(I18n.t("activerecord.models.omic_situation.one")) { omic_claim.omic_situation}     
        row(I18n.t("activerecord.models.omic_result.one")) { omic_claim.omic_result}     
        row(I18n.t("activerecord.attributes.omic_claim.open")) { status_tag((omic_claim.open ? "Obert" : "Tancat"), (omic_claim.open ? :ok : :error))}           
      end
    end
  end
  
  sidebar I18n.t("activerecord.models.omic_claim.other") + "/" + I18n.t("activerecord.models.omic_petitioner.one"), :only => :show do
    table_for omic_claim.omic_petitioner.omic_claims do |c|
      c.column("id") { |claim| link_to claim.display_name, admin_omic_claim_path(claim) }
      c.column("Status") { |claim| status_tag((claim.open ? "Open" : "closed"), (claim.open ? :ok : :error)) }
      c.column("Title") { |claim| link_to claim.omic_reclaimed.to_s, admin_omic_reclaimed_path(claim.omic_reclaimed) }
    end
  end

  sidebar I18n.t("activerecord.models.omic_claim.other") + "/" + I18n.t("activerecord.models.omic_reclaimed.one"), :only => :show do
    table_for omic_claim.omic_reclaimed.omic_claims do |c|
      c.column("id") { |claim| link_to claim.display_name, admin_omic_claim_path(claim) }
      c.column("Status") { |claim| status_tag((claim.open ? "Open" : "closed"), (claim.open ? :ok : :error))}
      c.column("Title") { |claim| link_to claim.omic_petitioner.to_s, admin_omic_petitioner_path(claim.omic_petitioner) }
    end
  end
  
  form  do |f|
    f.inputs do
      f.input :datetime, :as => :datepicker, :dateformat => :short
      f.input :omic_petitioner, :input_html => {:class => 'select2able' }
      
      #nested form
      #f.inputs :for => [:omic_petitioner, (f.object.omic_petitioner || f.object.build_omic_petitioner)] do |a| 
      #  a.input :firstname
      #  a.input :address
      #  a.input :id_doc
      #end
      f.input :omic_reclaimed, :input_html => {:class => 'select2able' } #, :hint=>"A qui reclama?"
      f.input :omic_sector, :input_html => {:class => 'select2able' }
      f.input :omic_mean, :input_html => {:class => 'select2able' }
      f.input :omic_reason, :input_html => {:class => 'select2able' }
      f.input :facts, :input_html => {:style => 'height: 100px'}
      f.input :pretensions, :input_html => {:style => 'height: 100px'}
      f.input :documents, :input_html => {:style => 'height: 50px'}
      f.input :notes, :input_html => {:style => 'height: 100px'}
      f.input :omic_situation, :input_html => {:class => 'select2able' }
      f.input :omic_result, :input_html => {:class => 'select2able' }
      
      f.input :open, :as => :select, collection: [['Si', 'true'], ['No', 'false']]
    end
    f.actions
  end 

end
