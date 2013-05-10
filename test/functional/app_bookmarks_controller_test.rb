require 'test_helper'

class AppBookmarksControllerTest < ActionController::TestCase
  setup do
    @app_bookmark = app_bookmarks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:app_bookmarks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create app_bookmark" do
    assert_difference('AppBookmark.count') do
      post :create, app_bookmark: { description: @app_bookmark.description, name: @app_bookmark.name, uid: @app_bookmark.uid, url: @app_bookmark.url }
    end

    assert_redirected_to app_bookmark_path(assigns(:app_bookmark))
  end

  test "should show app_bookmark" do
    get :show, id: @app_bookmark
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @app_bookmark
    assert_response :success
  end

  test "should update app_bookmark" do
    put :update, id: @app_bookmark, app_bookmark: { description: @app_bookmark.description, name: @app_bookmark.name, uid: @app_bookmark.uid, url: @app_bookmark.url }
    assert_redirected_to app_bookmark_path(assigns(:app_bookmark))
  end

  test "should destroy app_bookmark" do
    assert_difference('AppBookmark.count', -1) do
      delete :destroy, id: @app_bookmark
    end

    assert_redirected_to app_bookmarks_path
  end
end
