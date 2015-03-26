class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :color
      t.integer :weeks, null: false
      t.decimal :fee, null: false, precision: 10, scale: 2 
      t.datetime :start_at, null: false
      t.datetime :end_at

      t.timestamps null: false
    end
    add_index :projects, [:fee]
    add_index :projects, [:start_at]
  end
end
