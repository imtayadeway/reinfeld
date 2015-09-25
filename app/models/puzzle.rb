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
  FEN_REGEX = %r{(?<position>([1-8rnbqkp]+/){7}[1-8rnbqkp]+)\s(?<to_move>[wb])}i

  serialize :solution

  scope :solved, -> { where.not(:solution => nil) }

  def position
    fen_elements[:position]
  end

  def next
    return nil if self.class.last == self
    self.class.where("id > #{id}").first
  end

  def previous
    return nil if self.class.first == self
    self.class.where("id < #{id}").last
  end

  def to_move
    case fen_elements[:to_move]
    when "w", "W" then :white
    when "b", "B" then :black
    end
  end

  private

  def fen_elements
    fen.match(FEN_REGEX)
  end
end
