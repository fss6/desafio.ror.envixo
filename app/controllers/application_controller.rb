class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    around_action :switch_locale
    before_action :configure_permitted_parameters, if: :devise_controller?

    def url_options
        { locale: locale }.merge(super)
    end

    def switch_locale(&action)
        locale = params[:locale] || I18n.default_locale
        I18n.with_locale(locale, &action)
    end

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end