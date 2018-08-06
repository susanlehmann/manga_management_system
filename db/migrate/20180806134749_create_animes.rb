class CreateAnimes < ActiveRecord::Migration[5.2]
  def change
    create_table :animes do |t|
      t.string :name
      t.references :manga
      t.datetime :published_at

      t.timestamps
    end
  end
end
