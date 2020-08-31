module Admin::NewsHelper
    def news_placeholder_search_field
        search = t('helpers.info.search')
        title = t('attributes.defaults.title')
        subtitle = t('attributes.defaults.subtitle')
        tag = t('attributes.defaults.tag')
        "#{search} #{title}, #{subtitle}, #{tag}"
    end
end
