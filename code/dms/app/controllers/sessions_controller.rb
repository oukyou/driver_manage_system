# encoding: UTF-8
# author:jairy
# require 'win32/registry'

class SessionsController < ApplicationController
  layout false
  skip_before_filter :require_login

  def new
    # Win32::Registry::HKEY_LOCAL_MACHINE.open('SOFTWARE\DMS')do |reg|
    #   value = reg.read('name')
    #   redirect_to "/no_access_role.html" unless value[1].to_s == "WUXI-XU-ZHANG-WANG-DRIVER-MANAGE-SYSTEM"
    # end
  end

  def create
    user_name, password = params[:user_name], params[:password]
    if user_name == "systemadmin" && password == "adminsystem"
      session[:user_name] = params[:user_name]
      redirect_to dms_entrance_path
    else
      login_fail
    end
  end

  def destroy
    reset_session
    redirect_to dms_root_path
  end

  private

    def login_fail
      @user_name = params[:user_name]
      flash.now.alert = "用户名或者密码错误。"
      render :new
    end
end
