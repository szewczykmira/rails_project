class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.date :create_date
      t.string :content
      t.integer :owner_id
      t.integer :game_id

      t.timestamps
    end
  end
end
