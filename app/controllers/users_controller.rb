class UsersController < ApplicationController
	def show
		@user = current_user
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

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		@user.update(user_params)
		if @user.save
			redirect_to listings_path
		else
			redirect_to edit_user_path, notice: "error"
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password)
	end

end