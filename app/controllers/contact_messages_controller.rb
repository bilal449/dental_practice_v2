class ContactMessagesController < ApplicationController
  before_action :set_contact_message, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, :except => :new

  layout "manager", :except => :new
  # GET /contact_messages
  # GET /contact_messages.json
  def index
    @contact_messages = ContactMessage.all
  end

  # GET /contact_messages/1
  # GET /contact_messages/1.json
  def show
  end

  # GET /contact_messages/new
  def new
    @contact_message = ContactMessage.new
  end

  # GET /contact_messages/1/edit
  def edit
  end

  # POST /contact_messages
  # POST /contact_messages.json
  def create
    @contact_message = ContactMessage.new(contact_message_params)

    respond_to do |format|
      if @contact_message.save
        format.html { redirect_to :controller => 'home', :action => 'index'  }
        
      else
        format.html { render :new }
        format.json { render json: @contact_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_messages/1
  # PATCH/PUT /contact_messages/1.json
  def update
    respond_to do |format|
      if @contact_message.update(contact_message_params)
        format.html { redirect_to @contact_message, notice: 'Contact message was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact_message }
      else
        format.html { render :edit }
        format.json { render json: @contact_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_messages/1
  # DELETE /contact_messages/1.json
  def destroy
    @contact_message.destroy
    respond_to do |format|
      format.html { redirect_to contact_messages_url, notice: 'Contact message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

   def authenticate_user
    if session[:admin_id].nil?
         flash[:danger] = "Please log in to Continue."
         redirect_to :controller => 'session', :action => 'sign_in'
    elsif session[:LoginType] != 'Manager'
         redirect_to :controller => 'session', :action => 'sign_in'
        
    end    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_message
      @contact_message = ContactMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_message_params
      params.require(:contact_message).permit(:name, :phone_no, :email, :message)
    end
end
