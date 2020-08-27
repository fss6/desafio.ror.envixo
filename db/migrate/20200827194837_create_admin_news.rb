class CreateAdminNews < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_news do |t|
      t.string :title
      t.string :subtitle
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
