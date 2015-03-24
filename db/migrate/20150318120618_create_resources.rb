class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string  :name, null: false
      t.decimal :allocation, null: false, precision: 3, scale: 2 
      t.decimal :fee, null: false, precision: 10, scale: 2 
      t.integer :project_id

      t.timestamps null: false
    end
    add_index :resources, [:project_id]
  end
end
