class Library < ApplicationRecord
	has_many :books, as: :owner
end
