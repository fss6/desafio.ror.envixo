require 'test_helper'

class Admin::TagTest < ActiveSupport::TestCase

  def setup
    @tag = admin_tags(:one)
  end

  test "should not save tag without name" do
    @tag.name = nil
    assert_not @tag.save
  end  
  
  test "should not save tag without locale" do
    @tag.locale = nil
    assert_not @tag.save
  end 

  test "should not save tag without user" do
    @tag.user = nil
    assert_not @tag.save
  end

  test "should not save tag with the same name and locale" do
    tag_two = admin_tags(:two)
    tag_two.name = @tag.name
    tag_two.locale = @tag.locale
    assert @tag.save
    assert_not tag_two.save
  end  

  test "should tag clear video associations" do
    assert @tag.save
    video = admin_videos(:one)
    video.tags << @tag
    assert video.save
    assert_equal 1, video.tags.size
    assert @tag.destroy
    assert_equal 0, video.tags.size
  end  

  test "should tag clear news associations" do
    assert @tag.save
    news = admin_news(:one)
    news.tags << @tag
    assert news.save
    assert_equal 1, news.tags.size
    assert @tag.destroy
    assert_equal 0, news.tags.size
  end  
end
