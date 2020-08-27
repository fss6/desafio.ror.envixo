json.extract! admin_comment, :id, :content, :locale, :verified, :commentable_id, :commentable_type, :user_id, :created_at, :updated_at
json.url admin_comment_url(admin_comment, format: :json)
