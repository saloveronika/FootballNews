require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

 	test "should login" do
		vero = users(:one)
		post :create, :name => vero.name, :password => 'secret'
		assert_redirected_to admin_url
		assert_equal vero.id, session[:user_id]
	end

	test "should fail login" do
		vero = users(:one)
		post :create, :name => vero.name, :password => 'wrong'
		assert_redirected_to login_url
	end

	test "should logout" do
		delete :destroy
	assert_redirected_to articles_url
	end

end
