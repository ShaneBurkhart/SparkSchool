class HomeController < ApplicationController
  def index
    redirect_to courses_path if current_user
    @user = BetaUser.new
  end
end
