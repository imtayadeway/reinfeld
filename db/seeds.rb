Dir.glob(Rails.root.join("lib", "pgns", "*.pgn")).each do |pgn|
  PGN.parse(File.read(pgn)).reverse_each do |game|
    Puzzle.create!(:fen => game.tags["FEN"], :solution => game.moves)
  end
end
