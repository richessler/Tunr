class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_token
    end

    # Fast Look ups to quickly get specific info
    add_index :users, :email, unique: true
    add_index :users, :remeber_token
  end
end
