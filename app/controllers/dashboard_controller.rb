class DashboardController < ApplicationController
  before_action :require_login  # Ensure user is logged in

  def index
    @favorites = current_user.favorites.page(params[:page]).per(5)
  end
end
