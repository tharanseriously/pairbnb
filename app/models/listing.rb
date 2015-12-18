class Listing < ActiveRecord::Base
	default_scope {order(created_at: :asc)}
	belongs_to :user
	acts_as_taggable
end
