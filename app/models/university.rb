class University < ApplicationRecord
	has_many :books, as: :owner
end
