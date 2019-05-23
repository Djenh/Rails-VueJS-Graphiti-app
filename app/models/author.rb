class Author < ApplicationRecord
	has_many :books
	validates :full_name, presence: true, length: { minimum: 4 }
	validates :email, presence: true, uniqueness: true
end
