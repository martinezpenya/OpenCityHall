class AccessVisit < ActiveRecord::Base
  belongs_to :admin_user
  belongs_to :common_id_type

  accepts_nested_attributes_for :admin_user, :reject_if => :all_blank
  
  validates_presence_of :year, :datetime, :common_id_type, :id_doc, :name, :motivation, :enter_datetime

  validates_time :exit_datetime, {:after => :enter_datetime, 
                                  :allow_blank => true,
                                  :after_message => I18n.t("activerecord.models.access_visit.messages.exit_datetime_greater")
                                  }
  

#  validate :exit_date_must_be_greater_than_enter_date, :on => :update
#  def exit_date_must_be_greater_than_enter_date
#    #return if (!exit_datetime.blank?)
#    #errors.add(:exit_datetime, I18n.t("activerecord.models.access_visit.messages.exit_datetime_greater")) unless
#    #errors.add(:exit_datetime, enter_datetime.to_f.to_s + ' ' + exit_datetime.to_f.to_s) unless
#    #(exit_datetime.blank?) || (enter_datetime.to_f > exit_datetime.to_f)
#    
#    if (self.exit_datetime.blank?)
#      return true
#    elsif (self.enter_datetime > self.exit_datetime)
#      errors.add(:exit_datetime, "error")
#      #return false
#    else
#      #errors.add(:exit_datetime, "ok")
#      #return true
#    end
#    
#    
#    #if (!:exit_datetime.blank?) && (:exit_datetime > :enter_datetime)
#    #  errors.add(:exit_datetime, DateTime.current)
#    #end
#  end

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
