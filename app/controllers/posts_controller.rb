class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	def index
		@posts = Post.all
	end
	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = session[:user_id]
		if @post.save
			redirect_to @post
		else
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

	private

	def post_params
		params.require(:post).permit(:title, :url, :user_id)
	end

end
