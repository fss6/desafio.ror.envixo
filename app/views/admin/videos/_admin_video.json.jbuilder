json.extract! admin_video, :id, :title, :url, :user_id, :created_at, :updated_at
json.url admin_video_url(admin_video, format: :json)
