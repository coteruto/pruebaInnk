class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.string :genre
      t.decimal :price
      t.time :duration

      t.timestamps null: false
    end
  end
end
