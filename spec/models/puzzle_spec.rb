require "rails_helper"

RSpec.describe Puzzle, type: :model do
  describe "#answer" do
    it "can serialize and deserialize a list of moves" do
      fen = "3r2k1/1p5p/6p1/p2q1p2/P1Q5/1P5P/1P6/5RK1 w - - 0 1"
      answer = %w(Rd1 Qxc4 Rxd8+ Kf7 bxc4)
      puzzle = described_class.create(:fen => fen, :answer => answer)

      expect(puzzle.reload.answer).to eq(answer)
    end
  end

  describe "#position" do
    it "returns the position portion of the FEN" do
      fen = "3r2k1/1p5p/6p1/p2q1p2/P1Q5/1P5P/1P6/5RK1 w - - 0 1"
      answer = %w(Rd1 Qxc4 Rxd8+ Kf7 bxc4)
      puzzle = described_class.new(:fen => fen, :answer => answer)

      expected = "3r2k1/1p5p/6p1/p2q1p2/P1Q5/1P5P/1P6/5RK1"
      expect(puzzle.position).to eq(expected)
    end
  end
end
