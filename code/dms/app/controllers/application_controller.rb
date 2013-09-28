# encoding: utf-8
# author:jairy
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login

  private

    def require_login
      redirect_to dms_root_path unless session[:user_name]
    end
end
