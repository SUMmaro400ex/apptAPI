class DeletingAppointmentTest < ActionDispatch::IntegrationTest
   setup { @appointment = Appointment.create(first_name: 'Delete', last_name: 'Test', start_time: '2015-08-17T16:51:54.026Z', end_time: '2015-08-17T16:51:54.026Z' ) }
   test 'deletes appointment' do
     delete "/appointments/#{@appointment.id}"
     assert_equal 204, response.status
   end
 end
