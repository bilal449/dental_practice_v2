class StaffController < ApplicationController
  
  before_action :authenticate_user
  layout "staff"
  
  def dashboard
  end

  def authenticate_user
    if session[:admin_id].nil?
         flash[:danger] = "Please log in to Continue."
         redirect_to :controller => 'session', :action => 'sign_in'
    elsif session[:LoginType] != 'Staff'
         redirect_to :controller => 'session', :action => 'sign_in'
        
    end    
  end

  def logout
    session[:admin_id] = ""
    session[:admin_name] = ""
    session[:LoginType] = ""
    redirect_to :controller => 'session', :action => 'sign_in'

  end
end
