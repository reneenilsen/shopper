require 'test_helper'

class MigratesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @migrate = migrates(:one)
  end

  test "should get index" do
    get migrates_url
    assert_response :success
  end

  test "should get new" do
    get new_migrate_url
    assert_response :success
  end

  test "should create migrate" do
    assert_difference('Migrate.count') do
      post migrates_url, params: { migrate: { AddTitleToProduct: @migrate.AddTitleToProduct, title: @migrate.title } }
    end

    assert_redirected_to migrate_url(Migrate.last)
  end

  test "should show migrate" do
    get migrate_url(@migrate)
    assert_response :success
  end

  test "should get edit" do
    get edit_migrate_url(@migrate)
    assert_response :success
  end

  test "should update migrate" do
    patch migrate_url(@migrate), params: { migrate: { AddTitleToProduct: @migrate.AddTitleToProduct, title: @migrate.title } }
    assert_redirected_to migrate_url(@migrate)
  end

  test "should destroy migrate" do
    assert_difference('Migrate.count', -1) do
      delete migrate_url(@migrate)
    end

    assert_redirected_to migrates_url
  end
end
