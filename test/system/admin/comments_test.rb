require "application_system_test_case"

class Admin::CommentsTest < ApplicationSystemTestCase
  setup do
    @admin_comment = admin_comments(:one)
  end

  test "visiting the index" do
    visit admin_comments_url
    assert_selector "h1", text: "Admin/Comments"
  end

  test "creating a Comment" do
    visit admin_comments_url
    click_on "New Admin/Comment"

    fill_in "Commentable", with: @admin_comment.commentable_id
    fill_in "Commentable type", with: @admin_comment.commentable_type
    fill_in "Content", with: @admin_comment.content
    fill_in "Locale", with: @admin_comment.locale
    fill_in "User", with: @admin_comment.user_id
    check "Verified" if @admin_comment.verified
    click_on "Create Comment"

    assert_text "Comment was successfully created"
    click_on "Back"
  end

  test "updating a Comment" do
    visit admin_comments_url
    click_on "Edit", match: :first

    fill_in "Commentable", with: @admin_comment.commentable_id
    fill_in "Commentable type", with: @admin_comment.commentable_type
    fill_in "Content", with: @admin_comment.content
    fill_in "Locale", with: @admin_comment.locale
    fill_in "User", with: @admin_comment.user_id
    check "Verified" if @admin_comment.verified
    click_on "Update Comment"

    assert_text "Comment was successfully updated"
    click_on "Back"
  end

  test "destroying a Comment" do
    visit admin_comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Comment was successfully destroyed"
  end
end
