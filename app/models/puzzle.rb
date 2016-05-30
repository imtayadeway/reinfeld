# == Schema Information
#
# Table name: puzzles
#
#  id         :integer          not null, primary key
#  fen        :string
#  solution   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Puzzle < ActiveRecord::Base
  belongs_to :chapter

  FEN_REGEX = %r{(?<position>([1-8rnbqkp]+/){7}[1-8rnbqkp]+)\s(?<to_move>[wb])}i

  serialize :solution

  def position
    fen_elements[:position]
  end

  def next
    return nil if chapter.puzzles.last == self
    self.class.where(:chapter => chapter).where("id > #{id}").first
  end

  def previous
    return nil if chapter.puzzles.first == self
    self.class.where(:chapter => chapter).where("id < #{id}").last
  end

  def to_move
    case fen_elements[:to_move]
    when "w", "W" then :white
    when "b", "B" then :black
    end
  end

  def chapter_name
    chapter.name
  end

  def book_name
    book.name
  end

  # TODO: belongs_to :book
  def book
    chapter.book
  end

  private

  def fen_elements
    fen.match(FEN_REGEX)
  end
end
