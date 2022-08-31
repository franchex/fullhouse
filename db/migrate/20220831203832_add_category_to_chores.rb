class AddCategoryToChores < ActiveRecord::Migration[7.0]
  def change
    add_column :chores, :category, :string
  end
end
