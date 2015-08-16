class Appointment < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  def valid
    if self.start_time.nil? || self.end_time.nil?
      check = false
    elsif self.start_time.to_datetime > Time.now && self.end_time.to_datetime > Time.now
      appoinments = Appointment.all
      check=true
      appoinments.each do |apt|
        if self.start_time >= apt.start_time && self.start_time <= apt.end_time
          check = false
        elsif self.end_time >= apt.start_time && self.end_time <= apt.end_time
          check = false
        end
      end
    else
      check = false
    end
    check
  end

end
