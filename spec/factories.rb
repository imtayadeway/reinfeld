FactoryGirl.define do
  factory :puzzle do
    fen"3r2k1/1p5p/6p1/p2q1p2/P1Q5/1P5P/1P6/5RK1 w - - 0 1"
    answer %w(Rd1 Qxc4 Rxd8+ Kf7 bxc4)
  end
end
