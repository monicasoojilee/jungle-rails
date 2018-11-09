class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_AUTHENTICATE_USERNAME"], password: ENV["ADMIN_AUTHENTICATE_PASSWORD"], only: [:show]

  def show
  end
end
