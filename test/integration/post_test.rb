require 'test_helper'

class PostTest < ActionDispatch::IntegrationTest
  test 'creates appt' do
    post '/appointments',
    { appointment:
      { first_name: 'Jon', last_name: 'Rose', start_time: '0011-01-2017T11:00:00.000Z', end_time: '0011-01-2017T12:00:00.000Z' }
      }.to_json,
    { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
    assert_equal 204, response.status
  end

  test 'no nill for start date' do
    post '/appointments',
    { appointment:
      { first_name: 'Jon', last_name: 'Rose', start_time: nil, end_time: '0011-03-2017T11:00:00.000Z' }
    }.to_json,
    { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
    assert_equal 422, response.status
  end

  test 'no nill for end time' do
    post '/appointments',
    { appointment:
      { first_name: 'Jon', last_name: 'Rose', end_time: nil, start_time: '0011-04-2017T11:00:00.000Z' }
    }.to_json,
    { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
    assert_equal 422, response.status
  end

  test 'no nill for first name' do
    post '/appointments',
    { appointment:
      { first_name: nil, last_name: 'Rose', start_time: '0011-05-2017T11:00:00.000Z', end_time: '0011-06-2017T11:00:00.000Z' }
    }.to_json,
    { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
    assert_equal 422, response.status
  end

  test 'no nill for last name' do
    post '/appointments',
    { appointment:
      { first_name: 'Jon', last_name: nil, start_time: '0011-07-2017T11:00:00.000Z', end_time: '0011-08-2017T11:00:00.000Z' }
    }.to_json,
    { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
    assert_equal 422, response.status
  end

  test 'no end dates in the past' do
    post '/appointments',
    { appointment:
      { first_name: 'Jon', last_name: 'Rose', end_time: '0011-04-2015T11:00:00.000Z', start_time: '0011-04-2017T11:00:00.000Z' }
    }.to_json,
    { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
    assert_equal 422, response.status
  end

  test 'no start dates in the past' do
    post '/appointments',
    { appointment:
      { first_name: 'Jon', last_name: 'Rose', end_time: '0011-04-2017T11:00:00.000Z', start_time: '0011-04-2015T11:00:00.000Z' }
    }.to_json,
    { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
    assert_equal 422, response.status
  end

end
