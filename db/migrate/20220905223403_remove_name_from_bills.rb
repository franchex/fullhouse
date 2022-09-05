class RemoveNameFromBills < ActiveRecord::Migration[7.0]
  def change
    remove_column :bills, :name
  end
end
