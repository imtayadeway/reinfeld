FactoryBot.define do
  factory :book

  factory :chapter do
    book
  end

  factory :puzzle do
    book
    chapter
    fen "3r2k1/1p5p/6p1/p2q1p2/P1Q5/1P5P/1P6/5RK1 w - - 0 1"
    solution %w(Rd1 Qxc4 Rxd8+ Kf7 bxc4)
  end
end
