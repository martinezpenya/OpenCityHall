ActiveAdmin.register AdminUser do
  config.comments = false
  
  index do          
    column I18n.t("activerecord.attributes.admin_user.name"), :name
    column I18n.t("activerecord.attributes.admin_user.initials"), :initials
    column I18n.t("activerecord.attributes.admin_user.email"), :email                     
    column I18n.t("activerecord.attributes.admin_user.current_sign_in_at"), :current_sign_in_at, :format => :short
    column I18n.t("activerecord.attributes.admin_user.last_sign_in_at"), :last_sign_in_at           
    column I18n.t("activerecord.attributes.admin_user.sign_in_count"), :sign_in_count
    column I18n.t("activerecord.attributes.admin_user.admin"), :admin    
    if authorized?(:manage, AdminUser)         
      actions
    end                   
  end                                 

  filter :email                       

  form do |f|                         
    f.inputs "Admin Details" do       
      f.input :name
      f.input :initials                  
      f.input :email                  
      f.input :password               
      f.input :password_confirmation
      f.input :admin  
    end
    if authorized?(:manage, AdminUser)                         
      f.actions
    end                         
  end                                 
end