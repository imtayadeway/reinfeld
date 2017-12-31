class AddPuzzlesToChapters < ActiveRecord::Migration[5.1]
  def change
    change_table :puzzles do |t|
      t.belongs_to :chapter
    end
  end
end
