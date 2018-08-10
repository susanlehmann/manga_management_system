class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :phone
      t.integer :gender
      t.integer :role
      t.integer :status
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end
