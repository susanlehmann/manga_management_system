class CreateComposes < ActiveRecord::Migration[5.2]
  def change
    create_table :composes do |t|
      t.references :author
      t.references :manga

      t.timestamps
    end
  end
end
