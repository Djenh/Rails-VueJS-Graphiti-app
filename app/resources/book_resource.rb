class BookResource < ApplicationResource
  	attribute :title, :string
  	attribute :isbn, :string
  	attribute :author_id, :integer
  	attribute :owner_id, :integer
  	attribute :owner_type, :string
    attribute :created_at, :datetime, writable: false
    attribute :updated_at, :datetime, writable: false

  	belongs_to :author
  	
  	polymorphic_belongs_to :owner do
		group_by(:owner_type) do
			on(:Library)
	    on(:University)
		end
	end
end
