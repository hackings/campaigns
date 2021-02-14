class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :campaigns, foreign_key: :created_by
  has_many :discussions, foreign_key: :created_by
  has_many :comments, foreign_key: :created_by

  validates :email, :username, :password, presence: true
  validates :email, :username, uniqueness: true
  
end
