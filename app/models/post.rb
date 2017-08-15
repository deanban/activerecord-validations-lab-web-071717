class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: {minimum: 250}
	validates :summary, length: {maximum: 250}
	validates :category, inclusion: {in: ["Fiction", "Non-Fiction"], messege: "Invalid Category"}
	validate :clickbait

	def clickbait
		if title != nil && !title.start_with?('Won\'t Believe', 'Top', 'Secret', 'Guess', 'You Won\'t')
			errors.add(:title, "Not clickbait title")
		end
	end
end
