class RenameAnswerToSolution < ActiveRecord::Migration
  def change
    rename_column :puzzles, :answer, :solution
  end
end
