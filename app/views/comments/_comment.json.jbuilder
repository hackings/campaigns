json.extract! comment, :id, :commentable_id, :commentable_type, :body, :created_by, :created_at, :updated_at
json.url comment_url(comment, format: :json)
