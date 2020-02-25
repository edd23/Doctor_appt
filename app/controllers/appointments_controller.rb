class AppointmentsController < ApplicationController
  before_action :set_doctor

  def index
    @doctors = @doctor.appointments.where(role: 'doctor')
    @nurses = @doctor.appointments.where(role: 'nurse')
    @patients = @doctor.appointments.where(role: 'patient')
  end

  def new
    @appointment = @doctor.appointments.new
    @appointment = @doctor.appointments.new
  end

  def create
    @appointment = @doctor.appointments.new(appointments_params)
    if @appointment.save
      redirect_to doctor_appointments_path(@doctor)
    else
      render :new
    end
  end

  def destroy
    @appointment = @doctor.appointments.find(params[:id])
    @appointment.destroy
    redirect_to doctor_appointments_path(@doctor)
  end

  private
   def set_doctor
     @doctor = Doctor.find(params[:doctor_id]) 
   end

   def appointments_params
     params.require(:appointment).permit(:role, :user_id)
   end

end
