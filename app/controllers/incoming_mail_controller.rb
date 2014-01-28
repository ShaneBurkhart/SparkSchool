class IncomingMailController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def parse
    @mail = IncomingMail.new
    @mail.from = params[:envelope][:from]
    @mail.to = params[:envelope][:to]
    @mail.subject = params[:headers][:subject]
    @mail.body = params[:html] || params[:plain]

    if @mail.save
      render text: "success", status: 200
    else
      render text: "failed", status: 500
    end
  end

end
