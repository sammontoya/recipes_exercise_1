class AddRecipeToRating < ActiveRecord::Migration
  def change
    change_table :ratings do |table|
      table.column :recipe_id, :integer
    end
  end
end
