class User < ActiveRecord::Base
	has_many :movies
	has_many :series

	validates :name, presence: true, length: { maximum: 40 }
	validates :email, presence: true, uniqueness: true
end
