class UpdatingAppointmentTest < ActionDispatch::IntegrationTest
   setup { @appointment = Appointment.create!(first_name: 'Update', last_name: 'Test', start_time: '2015-08-16T16:51:54.026Z', end_time: '2015-08-16T16:51:54.026Z' ) }
   test 'successful update' do
     patch "/appointments/#{@appointment.id}",
     { appointment: { first_name: 'Update Edit' } }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
     assert_equal 200, response.status
     assert_equal 'Update Edit', @appointment.reload.first_name
   end
 end
