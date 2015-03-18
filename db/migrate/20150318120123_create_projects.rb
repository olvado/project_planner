class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :color, null: false
      t.integer :weeks, null: false
      t.decimal :total_fee, null: false
      t.date :start_at, null: false

      t.timestamps null: false
    end
    add_index :projects, [:total_fee]
    add_index :projects, [:start_at]
  end
end
