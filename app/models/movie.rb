class Movie < ApplicationRecord
	has_many :reviews
	validates :title, :rating, presence: true
	validates :total_gross, numericality:{greater_than_or_equal_to: 0}
	
	def flop?
		total_gross.blank? || total_gross < 50000000
	end

	def self.released
		where("release_on <= ?", Time.now).order("release_on asc")
	end
end

