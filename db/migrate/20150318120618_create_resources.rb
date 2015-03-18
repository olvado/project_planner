class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name, null: false
      t.integer :allocation, null: false
      t.integer :project_id, null: false

      t.timestamps null: false
    end
    add_index :resources, [:project_id]
  end
end
