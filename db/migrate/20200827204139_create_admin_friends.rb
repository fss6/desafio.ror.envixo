class CreateAdminFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_friends do |t|
      t.references :user, null: false, foreign_key: true
      t.references :friend, index: true, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
