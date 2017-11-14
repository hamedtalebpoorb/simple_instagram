class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # validates :user_name , length:{minimum:4 ,maximum:16}
  has_many :posts, dependent: :destroy
  has_many :comments,dependent: :destroy
  validates :user_name , length:{maximum:16}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         :confirmable
end
