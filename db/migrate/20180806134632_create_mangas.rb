class CreateMangas < ActiveRecord::Migration[5.2]
  def change
    create_table :mangas do |t|
      t.string :name
      t.text :detail
      t.integer :number_of_read
      t.integer :status
      t.float :average_rate
      t.references :category

      t.timestamps
    end
  end
end
