module Admin::VideosHelper
    def video_placeholder_search_field
        search = t('helpers.info.search')
        title = t('attributes.defaults.title')
        "#{search} #{title}"
    end
end
