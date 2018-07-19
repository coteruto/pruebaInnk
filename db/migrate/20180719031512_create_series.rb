class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.string :genre
      t.decimal :price
      t.integer :season

      t.timestamps null: false
    end
  end
end
