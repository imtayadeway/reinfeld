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

require "rails_helper"

RSpec.describe Puzzle, type: :model do
  describe "#solution" do
    it "can serialize and deserialize a list of moves" do
      solution = %w(Rd1 Qxc4 Rxd8+ Kf7 bxc4)
      puzzle = create(:puzzle, :solution => solution)

      expect(puzzle.reload.solution).to eq(solution)
    end
  end

  describe "#position" do
    it "returns the position portion of the FEN" do
      fen = "3r2k1/1p5p/6p1/p2q1p2/P1Q5/1P5P/1P6/5RK1 w - - 0 1"
      puzzle = build(:puzzle, :fen => fen)

      expected = "3r2k1/1p5p/6p1/p2q1p2/P1Q5/1P5P/1P6/5RK1"
      expect(puzzle.position).to eq(expected)
    end
  end

  describe "#next" do
    it "returns the next puzzle if there is one in the chapter" do
      chapter = Chapter.new(name: "Chapter 1")
      puzzle1 = create(:puzzle, chapter: chapter)
      puzzle2 = create(:puzzle, chapter: chapter)

      expect(puzzle1.next).to eq(puzzle2)
    end

    it "returns nil when there is none" do
      chapter = Chapter.new(name: "Chapter 1")
      puzzle = create(:puzzle, chapter: chapter)

      expect(puzzle.next).to be_nil
    end
  end

  describe "#previous" do
    it "returns the previous puzzle if there is one" do
      chapter = Chapter.new(name: "Chapter 1")
      _puzzle1 = create(:puzzle, chapter: chapter)
      puzzle2 = create(:puzzle, chapter: chapter)
      puzzle3 = create(:puzzle, chapter: chapter)

      expect(puzzle3.previous).to eq(puzzle2)
    end

    it "returns nil when there is none" do
      chapter = Chapter.new(name: "Chapter 1")
      puzzle = create(:puzzle, chapter: chapter)

      expect(puzzle.previous).to be_nil
    end
  end

  describe "#to_move" do
    it "returns `:white` when it is white's move" do
      fen = "3r2k1/1p5p/6p1/p2q1p2/P1Q5/1P5P/1P6/5RK1 w - - 0 1"
      puzzle = build(:puzzle, :fen => fen)

      expect(puzzle.to_move).to eq(:white)
    end

    it "returns `:black` when it is black's move" do
      fen = "3r2k1/1p5p/6p1/p2q1p2/P1Q5/1P5P/1P6/5RK1 b - - 0 1"
      puzzle = build(:puzzle, :fen => fen)

      expect(puzzle.to_move).to eq(:black)
    end
  end
end
