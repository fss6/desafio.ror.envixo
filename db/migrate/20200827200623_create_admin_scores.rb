class CreateAdminScores < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_scores do |t|
      t.integer :value
      t.bigint :scoreable_id
      t.string :scoreable_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :admin_scores, [:scoreable_type, :scoreable_id]
  end
end
