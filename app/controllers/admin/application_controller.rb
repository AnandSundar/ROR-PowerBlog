class Admin::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #use the admin layout
  layout 'admin/application'
end
