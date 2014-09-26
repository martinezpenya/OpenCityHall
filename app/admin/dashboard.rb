ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel I18n.t("activerecord.models.omic_claim.other") + " en '" + OmicSituation.find(1).name + "'" do  
          table_for OmicClaim.order('datetime desc').where('omic_situation_id=?',1) do |t|       
            t.column I18n.t("activerecord.models.omic_claim.other") do |item|
             link_to((item.year.to_s + "/" + item.id.to_s),admin_omic_claim_path(item.id))
            end
            t.column I18n.t("activerecord.attributes.omic_claim.datetime"), :sortable => :datetime do |item|
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
            column I18n.t("activerecord.models.omic_result.one"), :sortable => :omic_result do |item|
              ( !item.omic_result.nil? ? ( link_to item.omic_result.to_s, admin_omic_result_path(item.omic_result) ) : ("") )
            end
            column I18n.t("activerecord.attributes.omic_claim.open"), :sortable => :open do |item| 
              status_tag((item.open ? I18n.t("custom.state.female.open", :count => 1) : I18n.t("custom.state.female.closed", :count => 1)), (item.open ? :ok : :error))
            end
          end
        end
      end
    end
    columns do
      column do
        panel I18n.t("activerecord.models.omic_claim.other") + " en '" + OmicSituation.find(2).name + "'" do  
          table_for OmicClaim.order('datetime desc').where('omic_situation_id=?',2) do |t|       
            t.column I18n.t("activerecord.models.omic_claim.other") do |item|
             link_to((item.year.to_s + "/" + item.id.to_s), admin_omic_claim_path(item.id))
            end
            t.column I18n.t("activerecord.attributes.omic_claim.datetime"), :sortable => :datetime do |item|
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
            column I18n.t("activerecord.models.omic_result.one"), :sortable => :omic_result do |item|
              ( !item.omic_result.nil? ? ( link_to item.omic_result.to_s, admin_omic_result_path(item.omic_result) ) : ("") )
            end
            column I18n.t("activerecord.attributes.omic_claim.open"), :sortable => :open do |item| 
              status_tag((item.open ? I18n.t("custom.state.female.open", :count => 1) : I18n.t("custom.state.female.closed", :count => 1)), (item.open ? :ok : :error))
            end
          end
        end   
      end
    end
    columns do
      column do
        panel I18n.t("activerecord.models.omic_claim.other") + " en '" + OmicSituation.find(4).name + "'" do  
          table_for OmicClaim.order('datetime desc').where('omic_situation_id=?',4) do |t|       
            t.column I18n.t("activerecord.models.omic_claim.other") do |item|
             link_to((item.year.to_s + "/" + item.id.to_s), admin_omic_claim_path(item.id))
            end
            t.column I18n.t("activerecord.attributes.omic_claim.datetime"), :sortable => :datetime do |item|
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
            column I18n.t("activerecord.models.omic_result.one"), :sortable => :omic_result do |item|
              ( !item.omic_result.nil? ? ( link_to item.omic_result.to_s, admin_omic_result_path(item.omic_result) ) : ("") )
            end
            column I18n.t("activerecord.attributes.omic_claim.open"), :sortable => :open do |item| 
              status_tag((item.open ? I18n.t("custom.state.female.open", :count => 1) : I18n.t("custom.state.female.closed", :count => 1)), (item.open ? :ok : :error))
            end
          end
        end   
      end
    end       
    columns do
      column do
          panel  I18n.t("activerecord.models.omic_claim.other") + " " + I18n.t("custom.state.female.open.other") do
            table_for OmicClaim.order('datetime desc').where('open=?',true) do |t|       
              t.column I18n.t("activerecord.models.omic_claim.other") do |item|
               link_to((item.year.to_s + "/" + item.id.to_s), admin_omic_claim_path(item.id))
              end
              t.column I18n.t("activerecord.attributes.omic_claim.datetime"), :sortable => :datetime do |item|
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
              column I18n.t("activerecord.models.omic_result.one"), :sortable => :omic_result do |item|
                ( !item.omic_result.nil? ? ( link_to item.omic_result.to_s, admin_omic_result_path(item.omic_result) ) : ("") )
              end
              column I18n.t("activerecord.attributes.omic_claim.open"), :sortable => :open do |item| 
                status_tag((item.open ? I18n.t("custom.state.female.open", :count => 1) : I18n.t("custom.state.female.closed", :count => 1)), (item.open ? :ok : :error))
              end
            end
          end              
        end
      end
  end
end