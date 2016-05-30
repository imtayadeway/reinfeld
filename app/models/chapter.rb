class Chapter < ActiveRecord::Base
  belongs_to :book
  has_many :puzzles

  def book_name
    book.name
  end
end
