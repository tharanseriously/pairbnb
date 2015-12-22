class ListingsController < ApplicationController

	def index
		if params[:tag]
			@listings = Listing.tagged_with(params[:tag])
		else
			@listings = Listing.all			
		end
	end

	def show
		@listing = Listing.find(params[:id])
	end
	
	def new
		if signed_in?
			@listing = Listing.new
		else
			redirect_to "/auth/failure"
		end
	end

	def create
		@listing= Listing.new(listing_params)
		@listing.user_id = current_user.id
		if @listing.save
			redirect_to listings_path
		else
			redirect_to new_listing_path
		end
	end

	def edit
		@listing = Listing.find(params[:id])
	end

	def update
		@listing = Listing.find(params[:id])
		@listing.update(listing_params)
		if @listing.save
			redirect_to listings_path
		else
			redirect_to edit_listing_path
		end
	end

	private
	def listing_params
		params.require(:listing).permit(:name, :address, :room_type, :tag_list, :image)
	end
end