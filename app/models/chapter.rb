class Chapter < ActiveRecord::Base
  belongs_to :book
  has_many :puzzles
end
