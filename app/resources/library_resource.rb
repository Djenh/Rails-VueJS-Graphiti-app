class LibraryResource < ApplicationResource
  	attribute :name, :string
  	attribute :address, :string
  	attribute :created_at, :datetime, writable: false
  	attribute :updated_at, :datetime, writable: false

   	polymorphic_has_many :books, as: :owner
end
