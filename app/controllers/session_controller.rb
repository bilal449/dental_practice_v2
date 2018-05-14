class SessionController < ApplicationController
  def sign_in
  	@user = User.new
  end

  def sign_in_post

    @user = User.where(:username => params[:username]).where(:password => params[:password]).first
    #Login Type = 1 => Manager
    #Login Type = 2 => Staff Member

    if @user.present? && @user.loginType == 1
      session[:admin_id] = @user.id
      session[:admin_name] = @user.name
      session[:LoginType] = "Manager"
      flash[:notice] = "Signed in Successfully. Welcome to Manager Panel.."
      redirect_to :controller => 'manager', :action => 'dashboard'
      
    elsif @user.present? && @user.loginType == 2
      session[:admin_id] = @user.id
      session[:admin_name] = @user.name
      session[:LoginType] = "Staff"
     
      flash[:notice] = "Signed in Successfully. Welcome to Staff Panel"
      redirect_to :controller => 'staff', :action => 'dashboard'
      
    else

      flash[:notice] = "Invalid Email or Password"
      render :sign_in

    end
    
  end

  


end
