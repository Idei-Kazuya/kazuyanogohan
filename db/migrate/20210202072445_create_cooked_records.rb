class CreateCookedRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :cooked_records do |t|
      t.references :user, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
      t.index [:user_id, :recipe_id], unique: true
    end
  end
end
