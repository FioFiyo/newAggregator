class CommentsController < ApplicationController
	def new
		@user = current_user
		@post = Post.find(params[:post_id])
		@comment = Comment.new
	end

	def show
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(comment_params)
		@comment.user_id = params[:user_id]
		if @comment.save
			redirect_to posts_path
			flash[:success] = "Your comment was succesfully added"
		else
			@user = User.find(params[:user_id]) 
			@post = Post.find(params[:post_id])
			render 'new'
		end
	end

	def destroy
	end

	private

	def comment_params
		params.require(:comment).permit(:content, :user_id, :post_id)
	end
end
