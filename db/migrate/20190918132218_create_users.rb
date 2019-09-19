class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :names
      t.string :email
      t.string :password
      t.string :user_type

      t.timestamps
    end
  end
end
