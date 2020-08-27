class VideosController < ApplicationController
  # GET /admin/videos
  # GET /admin/videos.json
  def index
    @admin_videos = Admin::Video.all
  end
end
