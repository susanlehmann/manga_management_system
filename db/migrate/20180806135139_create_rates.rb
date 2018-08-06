class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.references :user
      t.references :manga
      t.integer :number_of_rates

      t.timestamps
    end
  end
end
