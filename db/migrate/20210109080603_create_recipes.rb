class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title, null: false  
      t.string :subtitle, null: false
      t.integer :recipe_type_id, null: false
      t.string :ingredient, null: false              
      t.text :method, null: false
      t.text :point
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
