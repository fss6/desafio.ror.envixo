class AddAcceptToAdminFriends < ActiveRecord::Migration[6.0]
  def change
    add_column :admin_friends, :accept, :boolean, default: false
  end
end
