class Comment < ApplicationRecord
	belongs_to :user, foreign_key: :created_by
	belongs_to :commentable, polymorphic: true

	validates :body, presence: true
end
