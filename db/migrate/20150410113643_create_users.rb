class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false 
      t.string :first_name 
      t.string :last_name 
      t.decimal :cost_rate, precision: 8, scale: 2 
      t.decimal :default_hourly_rate, precision: 8, scale: 2 
      t.string :department 
      t.boolean :has_access_to_all_future_projects, default: false 
      t.string :identity_url 
      t.boolean :is_active, default: true 
      t.boolean :is_admin, default: false 
      t.boolean :is_contractor, default: false 
      t.string :opensocial_identifier 
      t.integer :telephone 
      t.string :timezone 
      t.boolean :wants_newsletter, default: false 
      t.boolean :wants_weekly_digest, default: false 
      t.datetime :weekly_digest_sent_on 
      t.datetime :harvest_created_at
      t.datetime :harvest_updated_at
      t.decimal :expected_weekly_hours, precision: 5, scale: 2

      # Devise fields
      t.string :encrypted_password, :null => false, :default => ""
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      ## Rememberable
      t.datetime :remember_created_at
      ## Trackable
      t.integer  :sign_in_count, :default => 0, :null => false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.timestamps null: false
    end
  end
end
