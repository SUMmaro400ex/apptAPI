class AppointmentsController < ApplicationController
    def create
     appointment = Appointment.new(appointment_params)
     if appointment.save
       render nothing: true, status: 204, location: appointment
     else
       render json: appointment.errors, status: 422
     end
    end

    def update
     appointment = Appointment.find(params[:id])
     if appointment.update(appointment_params)
       render json: appointment, status: 200
     else
       render json: appointment.errors, status: 422
     end
   end

    def destroy

    end

    private
    def appointment_params
     params.require(:appointment).permit(:comments, :first_name, :last_name, :start_time, :end_time)
    end
  end
