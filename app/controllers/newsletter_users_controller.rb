class NewsletterUsersController < ApplicationController

  def create
    @newsletter_user = NewsletterUser.new newsletter_user_params
    if @newsletter_user.save
      redirect_to request.referrer, flash: { notice: "Thanks for signing up!" }
    else
      redirect_to request.referrer, flash: { error: @newsletter_user.errors.full_messages.to_sentence }
    end
  end

  private

    def newsletter_user_params
      params.require(:newsletter_user).permit(:email)
    end
end
