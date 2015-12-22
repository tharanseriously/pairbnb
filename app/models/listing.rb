class Listing < ActiveRecord::Base
	default_scope {order(created_at: :asc)}
	belongs_to :user
	has_many :reservations
	acts_as_taggable

	mount_uploader :image, ImageUploader
end
