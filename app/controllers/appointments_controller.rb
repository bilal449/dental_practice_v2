class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, :except => :new

  layout "staff", :except => :new
  # GET /appointments
  # GET /appointments.json
  def index

    if params[:search_dentist]
      @dentist = Dentist.find_by_name(params[:search_dentist])
      @appointments = @dentist.appointments.all

    elsif params[:search]

      @patient = Patient.find_by_name(params[:search])
      @appointments = @patient.appointments.all
      
    else
      @appointments = Appointment.all
    end

  end

  def patient_appoint
  end

  
  def dentist_appoint
  end


  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to :controller => 'home', :action => 'index'  }
        
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def authenticate_user
    if session[:admin_id].nil?
         flash[:danger] = "Please log in to Continue."
         redirect_to :controller => 'session', :action => 'sign_in'
    elsif session[:LoginType] != 'Staff'
         redirect_to :controller => 'session', :action => 'sign_in'
        
    end    
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:timeanddate, :dentist_id, :patient_id, :appointment_length, :fee_paid, :notes)
    end

  
end
