require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  setup do
    @article = articles(:one)
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
    assert_not_nil assigns(:articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count') do
      post :create, :article => @update
    end

    assert_redirected_to article_path(assigns(:article))
  end

  test "should show article" do
    get :show, :id => @article.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @article.to_param
    assert_response :success
  end

  test "should update article" do
    put :update, :id => @article.to_param, :article => @update
    assert_redirected_to article_path(assigns(:article))
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete :destroy, :id => @article.to_param
    end

    assert_redirected_to articles_path
  end
end
