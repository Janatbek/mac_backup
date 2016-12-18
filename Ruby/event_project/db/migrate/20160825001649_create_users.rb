class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firs_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :city
      t.string :state

      t.timestamps null: false
    end
  end
end