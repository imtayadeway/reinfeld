class ChaptersController < ApplicationController
  def show
    @chapter = Chapter.find(params[:id])
    @puzzles = @chapter.puzzles
  end
end
