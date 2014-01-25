class HomeController < ApplicationController
  def index
    @user = BetaUser.new
  end
end
