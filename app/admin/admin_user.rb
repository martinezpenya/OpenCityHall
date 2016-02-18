ActiveAdmin.register AdminUser do
  config.comments = false
  #controller do
  #  def permitted_params
  #    params[:user].permit(:utf8, :_method, :authenticity_token, :commit, :id, :password, :password_confirmation, :email)
  #    #params.permit :utf8, :_method, :authenticity_token, :commit, :id, :password, :password_confirmation, :email,
  #    #  admin_user: [:remember_me, :name, :admin, :roles, :initials]
  #  end
  #end

  controller do
    def update
      # get the currently logged in AdminUser's id
      current_id = current_admin_user.id
      if current_admin_user.admin? then
        def permitted_params
          params.permit admin_user: [:name, :email, :password, :initials, :password_confirmation, :roles, :admin]
        end
      else
        def permitted_params
          params.permit admin_user: [:password, :password_confirmation]
        end
      end
      # load the AdminUser being updated
      @admin_user = AdminUser.find(params[:id])
      # update the AdminUser with new attributes
      # if successful, this will sign out the AdminUser being updated
      if params[:admin_user][:password].blank? && params[:admin_user][:password_confirmation].blank? then
        params[:admin_user].delete("password")
        params[:admin_user].delete("password_confirmation")
        if @admin_user.update_without_password(permitted_params[:admin_user])
          #flash[:notice] = I18n.t('devise.passwords.updated_not_active')
          redirect_to '/admin/admin_users'
        end
      else
        if @admin_user.update_attributes(permitted_params[:admin_user])
          # if the updated AdminUser was the currently logged in AdminUser, sign them back in
          if @admin_user.id == current_id
            sign_in(AdminUser.find(current_id), :bypass => true)
          end
          flash[:notice] = I18n.t('devise.passwords.updated_not_active')
          redirect_to '/admin/admin_users'
        # display errors
        else
          render :action => :edit
        end
      end        
    end
  end

  filter :name, :if => proc{ current_admin_user.admin }
  filter :roles, :if => proc{ current_admin_user.admin }
  filter :email, :if => proc{ current_admin_user.admin }
  
  index do
    column I18n.t("activerecord.attributes.admin_user.name"), :name
    column I18n.t("activerecord.attributes.admin_user.initials"), :initials
    column I18n.t("activerecord.attributes.admin_user.email"), :email
    column I18n.t("activerecord.attributes.admin_user.current_sign_in_at"), :current_sign_in_at, :format => :short
    column I18n.t("activerecord.attributes.admin_user.last_sign_in_at"), :last_sign_in_at
    column I18n.t("activerecord.attributes.admin_user.sign_in_count"), :sign_in_count
    #if authorized?(:manage, AdminUser)
    column I18n.t("activerecord.attributes.admin_user.admin"), :admin
    column I18n.t("activerecord.attributes.admin_user.roles"), :roles
    actions
  #end
  end

  show do
    panel I18n.t("active_admin.details",:model => I18n.t("activerecord.models.admin_user.one")) do
      attributes_table_for admin_user do
        row(I18n.t("activerecord.attributes.admin_user.name")) { admin_user.name}
        row(I18n.t("activerecord.attributes.admin_user.initials")) { admin_user.initials}
        row(I18n.t("activerecord.attributes.admin_user.email")) { admin_user.email}
        row(I18n.t("activerecord.attributes.admin_user.current_sign_in_at")) { admin_user.current_sign_in_at}
        row(I18n.t("activerecord.attributes.admin_user.last_sign_in_at")) { admin_user.last_sign_in_at}
        row(I18n.t("activerecord.attributes.admin_user.sign_in_count")) { admin_user.sign_in_count}
      end
    end
  end

  form do |f|
    f.inputs I18n.t("active_admin.details",:model => I18n.t("activerecord.models.admin_user.one")) do
      f.input :name
      f.input :initials
      f.input :email
      f.input :password
      f.input :password_confirmation
      if authorized?(:manage, AdminUser)
        f.input :admin
        f.input :roles
      end
    end
    #if authorized?(:manage, AdminUser)
    f.actions
  #end

  end
end