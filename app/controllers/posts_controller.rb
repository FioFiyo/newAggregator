class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	helper_method :find_email

	def index
		@posts = Post.all
	end
	def new
		@post = Post.new
		@user = User.find(params[:user_id])
	end

	def create
		@user = User.find(params[:user_id])
		@post = @user.posts.new(post_params)
		if @post.save
			redirect_to @post
		else
			@user = User.find(params[:user_id]) 
			render 'new'
		end
	end

	def edit
		#TODO
		@post = Post.find(params[:id])
	end

	def show
		@post = Post.find(params[:id])
	end

	def destroy
		#TODO
	end

	def find_email(post)
		User.find(post.user_id).email
	end

	private

	def post_params
		params.require(:post).permit(:title, :url, :user_id)
	end

end
