Dir.glob(Rails.root.join("lib", "pgns", "*.pgn")).each do |pgn|
  PGN.parse(File.read(pgn)).reverse_each do |game|
    next if game.moves.none?

    book = Book.find_or_create_by!(:name => File.basename(pgn, ".pgn"))
    chapter = book.chapters.find_or_create_by!(:name => game.tags["Site"])

    chapter.puzzles.create!(
      fen: game.tags["FEN"],
      solution: game.moves,
    )
  end
end
