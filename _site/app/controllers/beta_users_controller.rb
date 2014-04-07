class BetaUsersController < ApplicationController
  def create
    @beta_user = BetaUser.new params.require(:beta_user).permit(:email, :sign_up_form)
    if @beta_user.save
      UserMailer.welcome_email(@beta_user).deliver
      redirect_to root_path, flash: {notice: "Thanks for signing up!  We'll keep you updated."}
    else
      flash[:error] = @beta_user.errors.full_messages.to_sentence
      redirect_to root_path
    end
  end
end
