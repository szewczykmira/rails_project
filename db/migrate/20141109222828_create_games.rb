class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :dscr
      t.date :release_date
      t.integer :category_id

      t.timestamps
    end
  end
end
