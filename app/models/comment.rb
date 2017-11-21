class Comment < ApplicationRecord
  class CommentsCountError < StandardError; end;
  belongs_to :user
  belongs_to :post

  before_create :check_comments_count

  def check_comments_count
    if self.class.where(user_id: self.user_id, post_id: self.post_id).count > 4
      raise CommentsCountError, "You can't create more than 5 comments"
    end
  end
end
