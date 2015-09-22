Dir.glob(Rails.root.join("lib", "pgns", "*.pgn")).each do |pgn|
  PGN.parse(File.read(pgn)).reverse_each do |game|
    solution = game.moves.any? ? game.moves : nil
    Puzzle.create!(:fen => game.tags["FEN"], :solution => solution)
  end
end
