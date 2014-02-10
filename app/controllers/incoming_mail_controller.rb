class IncomingMailController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:parse]
  before_filter :authenticate_user!, except: [:parse]
  authorize_resource except: [:parse]

  def index
    @mail = IncomingMail.all
  end

  def destroy
    @mail = IncomingMail.find(params[:id])
    @mail.destroy
    redirect_to incoming_mail_index_path
  end

  def parse
    @mail = IncomingMail.new
    puts params[:envelope][:from]
    puts params[:envelope][:to]
    puts params[:headers][:subject]
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
