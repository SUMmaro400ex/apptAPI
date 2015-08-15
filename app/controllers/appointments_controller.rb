class AppointmentsController < ApplicationController
    def create
     appointment = Appointment.new(appointment_params)
     if appointment.save
       render nothing: true, status: 204, location: appointment
     end
    end

    private
    def appointment_params
     params.require(:appointment).permit(:comments, :first_name, :last_name, :start_time, :end_time)
    end
  end
