class CreatePuzzles < ActiveRecord::Migration
  def change
    create_table :puzzles do |t|
      t.string :fen
      t.string :answer
      t.timestamps null: false
    end
  end
end
