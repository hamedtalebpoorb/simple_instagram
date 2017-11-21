class AddLikedToLikeDislikes < ActiveRecord::Migration[5.1]
  def change
    add_column :like_dislikes, :liked, :boolean , default:false
  end
end
