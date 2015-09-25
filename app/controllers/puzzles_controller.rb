class PuzzlesController < ApplicationController
  def index
    redirect_to puzzle_url(Puzzle.first)
  end

  def show
    @puzzle = Puzzle.solved.find(params[:id])
  end
end
