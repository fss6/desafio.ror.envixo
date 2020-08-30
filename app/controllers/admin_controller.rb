class AdminController < ApplicationController
    layout 'admin'
    load_and_authorize_resource unless: :is_admin?

    def is_admin?
        current_user.admin?
    end
end