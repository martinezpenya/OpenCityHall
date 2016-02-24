ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    if authorized?(:read, AccessVisit) then
      #if true then
      columns do
        column do
          panel I18n.t("activerecord.models.access_visit.other")  + " " + I18n.t("dashboard.stillin")  do
            table_for AccessVisit.order('datetime desc').where('exit_datetime is ?',nil) do |t|
              t.column I18n.t("activerecord.models.access_visit.other") do |item|
                link_to((item.year.to_s + "/" + item.id.to_s),admin_access_visit_path(item.id))
              end
              t.column I18n.t("activerecord.attributes.access_visit.datetime"), :sortable => :datetime do |item|
                ( !item.datetime.nil? ? (I18n.l(item.datetime, :format => :short) ) : ("") )
              end
              t.column I18n.t("activerecord.attributes.access_visit.id_doc"), :sortable => :id_doc do |item|
                item.common_id_type.to_s + " " +item.id_doc
              end
              t.column I18n.t("activerecord.attributes.access_visit.name"), :sortable => :name do |item|
                item.name
              end
              t.column I18n.t("activerecord.attributes.access_visit.motivation"), :sortable => :motivation do |item|
                item.motivation
              end
              t.column I18n.t("activerecord.attributes.access_visit.enter_datetime"), :sortable => :enter_datetime do |item|
                ( !item.enter_datetime.nil? ? (I18n.l(item.enter_datetime.in_time_zone, :format => :short) ) : ("") )
              end
              t.column I18n.t("activerecord.attributes.access_visit.exit_datetime"), :sortable => :exit_datetime do |item|
                ( !item.exit_datetime.nil? ? (I18n.l(item.exit_datetime.in_time_zone, :format => :short) ) : ("") )
              end
              if current_admin_user.roles.include? "A" then
                #sols si el rol és administrador
                t.column I18n.t("activerecord.models.admin_user.one"), :sortable => :admin_user_id do |item|
                  item.admin_user.name.to_s
                end
              end
            end
          end
        end
      end
      columns do
        column do
          panel I18n.t("activerecord.models.access_visit.other")  + " " + I18n.t("dashboard.todayout")  do
            table_for AccessVisit.order('datetime desc').where('datetime=? and exit_datetime is not ? ',Date.today,nil) do |t|
              t.column I18n.t("activerecord.models.access_visit.other") do |item|
                link_to((item.year.to_s + "/" + item.id.to_s),admin_access_visit_path(item.id))
              end
              t.column I18n.t("activerecord.attributes.access_visit.datetime"), :sortable => :datetime do |item|
                ( !item.datetime.nil? ? (I18n.l(item.datetime, :format => :short) ) : ("") )
              end
              t.column I18n.t("activerecord.attributes.access_visit.id_doc"), :sortable => :id_doc do |item|
                item.common_id_type.to_s + " " +item.id_doc
              end
              t.column I18n.t("activerecord.attributes.access_visit.name"), :sortable => :name do |item|
                item.name
              end
              t.column I18n.t("activerecord.attributes.access_visit.motivation"), :sortable => :motivation do |item|
                item.motivation
              end
              t.column I18n.t("activerecord.attributes.access_visit.enter_datetime"), :sortable => :enter_datetime do |item|
                ( !item.enter_datetime.nil? ? (I18n.l(item.enter_datetime.in_time_zone, :format => :short) ) : ("") )
              end
              t.column I18n.t("activerecord.attributes.access_visit.exit_datetime"), :sortable => :exit_datetime do |item|
                ( !item.exit_datetime.nil? ? (I18n.l(item.exit_datetime.in_time_zone, :format => :short) ) : ("") )
              end
              if current_admin_user.roles.include? "A" then
                #sols si el rol és administrador
                t.column I18n.t("activerecord.models.admin_user.one"), :sortable => :admin_user_id do |item|
                  item.admin_user.name.to_s
                end
              end
            end
          end
        end
      end
    end
    if authorized?(:read, OmicClaim) then
      columns do
        column do
          panel I18n.t("activerecord.models.omic_claim.other")  + " " + I18n.t("dashboard.register")  do
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
          panel I18n.t("activerecord.models.omic_claim.other") + " " + I18n.t("dashboard.signature")  do
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
end

