class CreateJoinTableNewsTags < ActiveRecord::Migration[6.0]
  def change
    create_join_table :admin_news, :admin_tags do |t|
      # t.index [:admin_news_id, :admin_tag_id]
      # t.index [:admin_tag_id, :admin_news_id]
    end
  end
end
