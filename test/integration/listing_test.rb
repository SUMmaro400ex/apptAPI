require 'test_helper'

class ListingTest < ActionDispatch::IntegrationTest
  # setup code here
  setup { host! 'example.com'}

  test 'returns a list of appointments' do
    get '/appointments'
    assert_equal 200, response.status
    refute_empty response.body
  end

end
