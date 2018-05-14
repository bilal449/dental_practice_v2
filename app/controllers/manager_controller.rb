class ManagerController < ApplicationController
  before_action :authenticate_user
  layout "manager"
  
  def dashboard
  end

  def reports
    @app = Appointment.all.sum(:fee_paid)
    @hours = Appointment.all.sum(:appointment_length)
    
  end

  def authenticate_user
    if session[:admin_id].nil?
         flash[:danger] = "Please log in to Continue."
         redirect_to :controller => 'session', :action => 'sign_in'
    elsif session[:LoginType] != 'Manager'
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
