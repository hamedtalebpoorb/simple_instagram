class CommentsController < ApplicationController
	before_action :set_post

	def create
		@comment = @post.comments.build(comment_params)
		@comment.user_id = current_user.id

		# collection.each do |variable|
   # 		code
		# end

		Comment.all.each do |comment|
			comment.update(comments_count: 0)
			# comments_count = comment.comments_count.to_i
   		if @comment.user_id == comment.user_id && @comment.post_id == comment.post_id
				# p "xyzzzzzzzzzzzzzzzzzzzzzzzzzz"
   			comment.comments_count = comment.comments_count + 1
   		end
		end


		if (@comment.save)
			p "pay attention:"
			p @comment.comments_count
				# p comment.user_id
			#end
			# p @comment
			# p @comment.user_id
			# p @comment.post_id
			# p @comment.comments_count
			respond_to do |format|
				#format.html { redirect_to root_path }
				format.js
			end
		else
			flash[:alert] = "not commented!"
			render root_path
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
