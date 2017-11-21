class LikeDislike < ApplicationRecord
  belongs_to :user
  belongs_to :post
end
