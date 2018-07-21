class Serie < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :genre, presence: true
  validates :price, presence: true, numericality: true
  validates :season, presence: true

  scope :get_available, -> { where(user: nil) }
end
