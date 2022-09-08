class AddAcceptedToassignments < ActiveRecord::Migration[7.0]
  def change
    add_column :assignments, :accepted, :boolean, default: false, null: false
  end
end
