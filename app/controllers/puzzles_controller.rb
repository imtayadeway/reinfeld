class PuzzlesController < ApplicationController
  def index
    redirect_to puzzle_url(Puzzle.first)
  end

  def show
    #
  end
end
