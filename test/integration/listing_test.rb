require 'test_helper'

class ListingTest < ActionDispatch::IntegrationTest
  # setup code here
  setup { host! 'example.com'}

  test 'returns a list of appointments' do
    get '/appointments'
    assert_equal 200, response.status
    refute_empty response.body
  end

  test 'filter by start and end time' do
    jonApt = Appointment.create!(first_name: 'Jon', last_name: 'Rose', start_time: '12/1/2015 07:00AM', end_time: '12/1/2015 08:00AM')
    get '/appointments?first_name=Jon'
    assert_equal 200, response.status
    appointments = JSON.parse(response.body)
    names = appointments.collect { |a| a['first_name'] }
    assert_includes names, 'Jon'

  end

end
