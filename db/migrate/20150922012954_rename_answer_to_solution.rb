class RenameAnswerToSolution < ActiveRecord::Migration[5.1]
  def change
    rename_column :puzzles, :answer, :solution
  end
end
