class AccessVisit < ActiveRecord::Base
  belongs_to :admin_user
  belongs_to :common_id_type

  accepts_nested_attributes_for :admin_user, :reject_if => :all_blank
  
  validates_presence_of :year, :datetime, :common_id_type, :id_doc, :name, :motivation, :enter_datetime

  #### requires gem 'validates_timeliness'
  #validates_time :exit_datetime, {:after => :enter_datetime, 
  #                                :allow_blank => true,
  #                                :after_message => I18n.t("activerecord.models.access_visit.messages.exit_datetime_greater")
  #                                }
  
  def exit!
    self.exit_datetime = Time.current
    self.save
  end
  
  #def after_initialize
  #  if !:enter_datetime.blank?
  #    enter_datetime = Time.zone.utc_to_local enter_datetime
  #  end
  #end

  def to_s
    self.id.to_s
  end

  def display_name
    self.year.to_s + "/"+ self.id.to_s
  end
end
