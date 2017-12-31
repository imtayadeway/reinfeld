class AddBooksAssociationToPuzzle < ActiveRecord::Migration[5.1]
  def change
    change_table :puzzles do |t|
      t.belongs_to :book
    end
  end
end
