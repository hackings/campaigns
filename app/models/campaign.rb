class Campaign < ApplicationRecord
  
  DURATIONS = {
	within_1_week: "within 1 week",
	within_1_month: "within 1 month",
	within_3_months: "within 3 months"
  }
  attr_accessor :tag_names

  enum estimated_duration: { "within 1 week": 0, "within 1 month": 1, "within 3 months": 2 }

  #has_many :discussions
  belongs_to :user, foreign_key: :created_by
  has_many :discussions
  has_many :comments, as: :commentable
  has_many :tags


  validates :title, :purpose, :user, presence: true

  before_save :build_tags

  def tag_names
    @tag_names ||= tags.collect(&:name).join(",")
  end

  def tag_names=(tag_names)
    @tag_names = tag_names.split(",")
  end

  def new_commentanle_path
    Rails.application.routes.url_helpers.new_campaign_comment_path(self)
  end 

  def edit_commentanle_path(comment)
    Rails.application.routes.url_helpers.edit_campaign_comment_path(self,comment)
  end 

  def commentanle_path(comment)
    Rails.application.routes.url_helpers.campaign_comment_path(self,comment)
  end 

  def commentanles_path
    Rails.application.routes.url_helpers.campaign_comments_path(self)
  end 

  def show_path
    Rails.application.routes.url_helpers.campaigns_path
  end 


private 
  def build_tags
    self.tags = []
    @tag_names.each do |t|
      tg = Tag.find_or_create_by(name: t)
      self.tags << tg
    end
  end   

end
