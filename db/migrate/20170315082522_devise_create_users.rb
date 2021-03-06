class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      t.string :first_name, null: false
      t.string :last_name,  null: false

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
  end
end
