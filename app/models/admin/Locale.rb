class Admin::Locale
    def self.all
        locales = []
        I18n.available_locales.each do |locale|
            locales.push([
                I18n.t(:language, locale: locale),
                locale
            ])
        end
        locales
    end
end
  