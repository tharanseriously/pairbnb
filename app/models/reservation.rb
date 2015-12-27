class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :listing

	def total_days
		(self.end_date - self.start_date).to_i
	end
end
