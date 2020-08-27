class CreateAdminTags < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_tags do |t|
      t.string :name
      t.string :locale
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :admin_tags, [:locale]
  end
end
