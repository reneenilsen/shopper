require "application_system_test_case"

class MigratesTest < ApplicationSystemTestCase
  setup do
    @migrate = migrates(:one)
  end

  test "visiting the index" do
    visit migrates_url
    assert_selector "h1", text: "Migrates"
  end

  test "creating a Migrate" do
    visit migrates_url
    click_on "New Migrate"

    fill_in "Addtitletoproduct", with: @migrate.AddTitleToProduct
    fill_in "Title", with: @migrate.title
    click_on "Create Migrate"

    assert_text "Migrate was successfully created"
    click_on "Back"
  end

  test "updating a Migrate" do
    visit migrates_url
    click_on "Edit", match: :first

    fill_in "Addtitletoproduct", with: @migrate.AddTitleToProduct
    fill_in "Title", with: @migrate.title
    click_on "Update Migrate"

    assert_text "Migrate was successfully updated"
    click_on "Back"
  end

  test "destroying a Migrate" do
    visit migrates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Migrate was successfully destroyed"
  end
end
