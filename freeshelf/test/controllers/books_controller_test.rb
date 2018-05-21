require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get authors" do
    get books_authors_url
    assert_response :success
  end

end
