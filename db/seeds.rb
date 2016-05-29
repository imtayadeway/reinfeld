Dir.glob(Rails.root.join("lib", "pgns", "*.pgn")).each do |pgn|
  book = Book.create!(:name => File.basename(pgn, ".pgn"))
  PGN.parse(File.read(pgn)).reverse_each do |game|
    chapter = book.chapters.find_or_create_by!(:name => game.tags["Site"])
    solution = game.moves.any? ? game.moves : nil
    chapter.puzzles.create!(:fen => game.tags["FEN"], :solution => solution)
  end
end
