Dir.glob(Rails.root.join("lib", "pgns", "*.pgn")).each do |pgn|
  PGN.parse(File.read(pgn)).map do |game|
    Puzzle.create!(:fen => game.tags["FEN"], :answer => game.moves)
  end
end
