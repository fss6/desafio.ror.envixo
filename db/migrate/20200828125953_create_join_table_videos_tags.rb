class CreateJoinTableVideosTags < ActiveRecord::Migration[6.0]
  def change
    create_join_table :admin_videos, :admin_tags do |t|
      t.index [:admin_video_id, :admin_tag_id]
      t.index [:admin_tag_id, :admin_video_id]
    end
  end
end
