class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id
			flash[:success] = "Welcome! You can start adding your news now."
			redirect_to '/posts'
		else
			flash[:warning] = "Invalid email or password. Try again"
			render :new
		end
	end

	private

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end

end
