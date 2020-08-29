require 'test_helper'

class Admin::NewsTest < ActiveSupport::TestCase
  def setup
    @news = admin_news(:one)
  end

  test "should not save news without title" do
    @news.title = nil
    assert_not @news.save
  end  

  test "should not save news without subtitle" do
    @news.subtitle = nil
    assert_not @news.save
  end  
  
  test "should not save news without content" do
    @news.content = nil
    assert_not @news.save
  end 

  test "should not save news without user" do
    @news.user = nil
    assert_not @news.save
  end

  test "should news clear tags" do
    tag = admin_tags(:one)
    assert tag.save
    @news.tags << tag
    assert @news.save
    assert_equal 1, @news.tags.size
    assert @news.destroy
    assert_equal 0, tag.news.size
  end  
end
