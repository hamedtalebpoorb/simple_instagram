class CommentsController < ApplicationController
	before_action :set_post

	def create

		@comment = @post.comments.build(comment_params)
		@comment.user_id = current_user.id

		Comment.all.each do |comment|
   		if @comment.user_id == comment.user_id && @comment.post_id == comment.post_id
   			@comment.comments_count = @comment.comments_count + 1
   		end
		end

		if @comment.comments_count <= 4
			if @comment.save #innier if
				respond_to do |format|
					#format.html { redirect_to root_path }
					format.js
				end
			end #innier end
		else
			# flash[:notice] = "not commented!"
			render root_path
			# p "hiiiiiiiiiiiiiiiiiiiiiiiiii"
		end

	end

	def destroy
		@comment = @post.comments.find(params[:id])

		@comment.destroy
		flash[:success] = "comment deleted :("
		redirect_to root_path
	end

	private

	def comment_params
		params.require(:comment).permit(:content)
	end

	def set_post
		@post = Post.find(params[:post_id])
	end
end
