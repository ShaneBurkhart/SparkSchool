class BetaUsersController < ApplicationController
  def create
    @beta_user = BetaUser.new params.require(:beta_user).permit(:email, :sign_up_form)
    if @beta_user.save
      redirect_to root_path, flash: {notice: "Thanks for signing up!  We'll keep you updated."}
    else
      flash[:error] = "Sorry but something went wrong."
      render "home/index"
    end
  end
end
