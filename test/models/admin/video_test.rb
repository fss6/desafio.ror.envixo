require 'test_helper'

class Admin::VideoTest < ActiveSupport::TestCase
  def setup
    @video = admin_videos(:one)
  end

  test "should not save video without title" do
    @video.title = nil
    assert_not @video.save
  end  
  
  test "should not save video without url" do
    @video.url = nil
    assert_not @video.save
  end 

  test "should not save video without user" do
    @video.user = nil
    assert_not @video.save
  end

  test "should not save video with invalid url" do
    video_two = admin_videos(:two)
    video_two.url = 'embed.com'
    assert @video.save
    assert_not video_two.save
  end
  
  test "should video clear tags" do
    tag = admin_tags(:one)
    assert tag.save
    @video.tags << tag
    assert @video.save
    assert_equal 1, @video.tags.size
    assert @video.destroy
    assert_equal 0, tag.videos.size
  end  
end
