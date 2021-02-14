class Discussion < ApplicationRecord

	belongs_to :user, foreign_key: :created_by
	belongs_to :campaign
	has_many :comments, as: :commentable

	validates :title, :user, presence: true

	validate(on: :create) do |d|
		if d.user.discussions.where(campaign_id: d.campaign_id).count > 0
			errors.add(:base, "#{d.user.username} can create at most one topic in this campaign")
		end 
	end 


  def new_commentanle_path
    Rails.application.routes.url_helpers.new_discussion_comment_path(self)
  end 

  def edit_commentanle_path(comment)
    Rails.application.routes.url_helpers.edit_discussion_comment_path(self,comment)
  end 

  def commentanle_path(comment)
    Rails.application.routes.url_helpers.discussion_comment_path(self,comment)
  end 

  def commentanles_path
    Rails.application.routes.url_helpers.discussion_comments_path(self)
  end 

  def show_path
    Rails.application.routes.url_helpers.campaign_discussions_path(self.campaign)
  end 
  

end
