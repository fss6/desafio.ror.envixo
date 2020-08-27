require "application_system_test_case"

class Admin::TagsTest < ApplicationSystemTestCase
  setup do
    @admin_tag = admin_tags(:one)
  end

  test "visiting the index" do
    visit admin_tags_url
    assert_selector "h1", text: "Admin/Tags"
  end

  test "creating a Tag" do
    visit admin_tags_url
    click_on "New Admin/Tag"

    fill_in "Locale", with: @admin_tag.locale
    fill_in "Name", with: @admin_tag.name
    fill_in "User", with: @admin_tag.user_id
    click_on "Create Tag"

    assert_text "Tag was successfully created"
    click_on "Back"
  end

  test "updating a Tag" do
    visit admin_tags_url
    click_on "Edit", match: :first

    fill_in "Locale", with: @admin_tag.locale
    fill_in "Name", with: @admin_tag.name
    fill_in "User", with: @admin_tag.user_id
    click_on "Update Tag"

    assert_text "Tag was successfully updated"
    click_on "Back"
  end

  test "destroying a Tag" do
    visit admin_tags_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tag was successfully destroyed"
  end
end
