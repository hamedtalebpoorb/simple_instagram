class CommentsController < ApplicationController
	before_action :set_post

	def create

		@comment = @post.comments.build(comment_params)
		@comment.user_id = current_user.id
		if Comment.where(user_id: current_user,post_id: @post.id).count <= 4
			if @comment.save
				respond_to do |format|
					format.js
				end
			end
		else
			redirect_to root_path
		end
	end

	def destroy
		@comment = @post.comments.find(params[:id])

		if @comment.destroy
			respond_to do |format|
				format.js
			end
		end
		#flash[:success] = "comment deleted :("
		#redirect_to root_path
	end

	private

	def comment_params
		params.require(:comment).permit(:content)
	end

	def set_post
		@post = Post.find(params[:post_id])
	end
end
