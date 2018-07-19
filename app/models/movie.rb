class Movie < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :genre, presence: true
  validates :price, presence: true, numericality: true
  validates :duration, presence: true, numericality: { greater_than: 0, less_than: 1000 }
end
