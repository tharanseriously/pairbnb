class UsersController < ApplicationController
	def show
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			current_user = @user
			redirect_to listings_path
		end
	end


	private
	def user_params
		params.require(:user).permit(:name, :email, :password)
	end

end