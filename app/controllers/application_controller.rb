class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    around_action :switch_locale

    def url_options
        { locale: locale }.merge(super)
    end

    def switch_locale(&action)
        locale = params[:locale] || I18n.default_locale
        I18n.with_locale(locale, &action)
    end
end
