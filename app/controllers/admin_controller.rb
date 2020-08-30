class AdminController < ApplicationController
    layout 'admin'
    load_and_authorize_resource
end