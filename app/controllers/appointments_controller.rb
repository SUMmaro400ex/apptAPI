class AppointmentsController < ApplicationController
  before_action :set_appt, only: [:update, :destroy]

  def index
    appointments = Appointment.all

    if start_time = params[:start_time]
      appointments = appointments.where(start_time: start_time)
    end

    if end_time = params[:end_time]
      appointments = appointments.where(end_time: end_time)
    end
    render json: appointments, status: 200
  end

  def create
   appointment = Appointment.new(appointment_params)

   if appointment.valid
     if appointment.save
       render nothing: true, status: 204, location: appointment
     else
       render json: appointment.errors, status: 422
     end
   else
     render json: appointment.errors, status: 422
   end
  end

  def update
   if @appointment.update(appointment_params)
     render json: @appointment, status: 200
   else
     render json: @appointment.errors, status: 422
   end
  end

  def destroy
    @appointment.destroy
    head 204
  end

  private
  def appointment_params
    params.require(:appointment).permit(:comments, :first_name, :last_name, :start_time, :end_time)
  end

  def set_appt
    @appointment = Appointment.find(params[:id])
  end

end
