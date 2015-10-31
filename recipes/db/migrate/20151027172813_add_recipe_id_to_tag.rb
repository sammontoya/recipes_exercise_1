class AddRecipeIdToTag < ActiveRecord::Migration
  def change
    change_table :tags do |table|
      table.column :recipe_id, :integer
    end
  end
end
