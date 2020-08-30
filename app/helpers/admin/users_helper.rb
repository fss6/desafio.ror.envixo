module Admin::UsersHelper
    def is_admin?(test) 
        test ? t('helpers.terms.yes') : t('helpers.terms.not')
    end

    def is_deactivated?(test)
        test ? t('helpers.terms.yes') : t('helpers.terms.not')
    end

    def hidden_admin_buttom?(user)
        user.admin?
    end

    def hidden_deactivated_buttom?(user)
        user == current_user || user.deactivated?
    end
end
