require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  setup do
    @admin = admins(:one)
	@update = {
		:title => 'Football',
		:description => 'A long time ago...',
		:image_url => 'vero.jpg',
		:video_url => '<iframe width="480" height="390" src="http://www.youtube.com/embed/xbDI_pxD_y0" frameborder="0" allowfullscreen></iframe>'
		}
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin" do
    assert_difference('Admin.count') do
      post :create, :admin => @update
    end

    assert_redirected_to admin_path(assigns(:admin))
  end

  test "should show admin" do
    get :show, :id => @admin.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admin.to_param
    assert_response :success
  end

  test "should update admin" do
    put :update, :id => @admin.to_param, :admin => @update
    assert_redirected_to admin_path(assigns(:admin))
  end

  test "should destroy admin" do
    assert_difference('Admin.count', -1) do
      delete :destroy, :id => @admin.to_param
    end

    assert_redirected_to admins_path
  end
end
