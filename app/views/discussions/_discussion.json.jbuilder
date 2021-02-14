json.extract! discussion, :id, :campaign_id, :title, :created_by, :created_at, :updated_at
json.url discussion_url(discussion, format: :json)
