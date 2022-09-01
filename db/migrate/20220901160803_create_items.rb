class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, default: ""
      t.references :shopping_list, null: false, foreign_key: true
      t.boolean :done, null: false, default: false

      t.timestamps
    end
  end
end
