require "application_system_test_case"

class Admin::VideosTest < ApplicationSystemTestCase
  setup do
    @admin_video = admin_videos(:one)
  end

  test "visiting the index" do
    visit admin_videos_url
    assert_selector "h1", text: "Admin/Videos"
  end

  test "creating a Video" do
    visit admin_videos_url
    click_on "New Admin/Video"

    fill_in "Title", with: @admin_video.title
    fill_in "Url", with: @admin_video.url
    fill_in "User", with: @admin_video.user_id
    click_on "Create Video"

    assert_text "Video was successfully created"
    click_on "Back"
  end

  test "updating a Video" do
    visit admin_videos_url
    click_on "Edit", match: :first

    fill_in "Title", with: @admin_video.title
    fill_in "Url", with: @admin_video.url
    fill_in "User", with: @admin_video.user_id
    click_on "Update Video"

    assert_text "Video was successfully updated"
    click_on "Back"
  end

  test "destroying a Video" do
    visit admin_videos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Video was successfully destroyed"
  end
end
