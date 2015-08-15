require 'test_helper'

class PostTest < ActionDispatch::IntegrationTest
  test 'creates appt' do
    post '/appointments',
    { appointment:
      { first_name: 'Jon', last_name: 'Rose', start_time: '0011-01-13T11:00:00.000Z', end_time: '0011-01-13T12:00:00.000Z' }
    }.to_json,
    { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
    assert_equal 204, response.status
  end
end
