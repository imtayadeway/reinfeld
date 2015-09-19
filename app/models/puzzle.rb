# == Schema Information
#
# Table name: puzzles
#
#  id         :integer          not null, primary key
#  fen        :string
#  answer     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Puzzle < ActiveRecord::Base
  serialize :answer

  def position
    fen.match(%r{([1-8rnbqkp]+/){7}[1-8rnbqkp]+}i).to_s
  end

  def next
    return nil if self.class.last == self
    self.class.where("id > #{id}").first
  end

  def previous
    return nil if self.class.first == self
    self.class.where("id < #{id}").first
  end
end
