class AddBooksAssociationToPuzzle < ActiveRecord::Migration
  def change
    change_table :puzzles do |t|
      t.belongs_to :book
    end
  end
end
