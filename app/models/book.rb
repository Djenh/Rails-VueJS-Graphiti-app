class Book < ApplicationRecord
  belongs_to :author
  belongs_to :owner, polymorphic: true

  validates :title, :isbn, presence: true
end
