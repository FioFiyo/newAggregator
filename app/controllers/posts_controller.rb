class PostsController < ApplicationController

	def index
		puts 'Its index'
	end
	def new
		
	end

	def create
	end

	def edit

	end

	def show
	end

	def destroy
	end

	private

	def post_params
		params.require(:post).permit(:tite, :url)
	end

end
