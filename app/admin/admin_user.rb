ActiveAdmin.register AdminUser do
  config.comments = false
  
  index do                            
    column :name
    column :initials
    column :email                     
    column :current_sign_in_at        
    column :last_sign_in_at           
    column :sign_in_count
    column :admin    
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