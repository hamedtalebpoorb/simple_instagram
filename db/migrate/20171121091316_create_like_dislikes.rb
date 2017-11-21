class CreateLikeDislikes < ActiveRecord::Migration[5.1]
  def change
    create_table :like_dislikes do |t|

      t.timestamps
    end
  end
end
