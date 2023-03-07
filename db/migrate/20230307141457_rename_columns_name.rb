class RenameColumnsName < ActiveRecord::Migration[7.0]
  def change
    rename_column :foods, :users_id, :user_id
    rename_column :recipes, :users_id, :user_id
    rename_column :recipe_foods, :foods_id, :food_id
    rename_column :recipe_foods, :recipes_id, :recipe_id
  end
end
