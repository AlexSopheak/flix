require 'test_helper'
class ListingMoviesTest < ActionDispatch::IntegrationTest
	setup {host! 'api.examples.com'}
	test 'return list of all movies'
	get '/movies'
	assert_equal 200, response.status
	refute_empty response.body
end
