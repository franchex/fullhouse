class CreateChores < ActiveRecord::Migration[7.0]
  def change
    create_table :chores do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.date :due_date
      t.references :space, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
