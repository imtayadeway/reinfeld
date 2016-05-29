class AddPuzzlesToChapters < ActiveRecord::Migration
  def change
    change_table :puzzles do |t|
      t.belongs_to :chapter
    end
  end
end
