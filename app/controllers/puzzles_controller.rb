class PuzzlesController < ApplicationController
  def index
    redirect_to puzzle_url(Puzzle.first)
  end

  def show
    @puzzle = Puzzle.find(params[:id])
  end
end
