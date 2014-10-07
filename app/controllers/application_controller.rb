class ApplicationController < ActionController::Base
  protect_from_forgery

  # Override build_footer method in ActiveAdmin::Views::Pages
  # Requires file in lib/active_admin_views_pages_base.rb
  require 'active_admin_views_pages_base.rb'
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
end

before_filter :set_locale_from_browser
 def set_locale_from_browser
   #if (session[:initialized].nil? || !session[:initialized])
     #logger.debug "***** Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
     I18n.locale = extract_locale_from_accept_language_header
     I18n.default_locale = extract_locale_from_accept_language_header
     I18n.reload!
     #logger.debug "***** Locale set to '#{I18n.locale}'"
     #logger.debug "***** Default_locale set to '#{I18n.locale}'"
   #else
   #  logger.debug "***** Locale already set to '#{I18n.locale}'"
   #  logger.info "***** Locale already set to '#{I18n.locale}'"
   #end
   #  session[:initialized] = true
 end
 private 
   def extract_locale_from_accept_language_header
     request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
 end
end

