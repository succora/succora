require 'test_helper'

class ProjectPagesControllerTest < ActionController::TestCase
  setup do
    @project_page = project_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_page" do
    assert_difference('ProjectPage.count') do
      post :create, project_page: { description: @project_page.description, subtitle: @project_page.subtitle, title: @project_page.title }
    end

    assert_redirected_to project_page_path(assigns(:project_page))
  end

  test "should show project_page" do
    get :show, id: @project_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_page
    assert_response :success
  end

  test "should update project_page" do
    patch :update, id: @project_page, project_page: { description: @project_page.description, subtitle: @project_page.subtitle, title: @project_page.title }
    assert_redirected_to project_page_path(assigns(:project_page))
  end

  test "should destroy project_page" do
    assert_difference('ProjectPage.count', -1) do
      delete :destroy, id: @project_page
    end

    assert_redirected_to project_pages_path
  end
end
