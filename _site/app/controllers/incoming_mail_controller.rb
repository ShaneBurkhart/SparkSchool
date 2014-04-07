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
    puts "From: #{params[:headers][:From]}"
    puts "To: #{params[:headers][:To]}"
    puts "Subject: #{params[:headers][:Subject]}"
    puts "Body: : #{params[:html] || params[:plain]}"
    @mail.from = params[:headers][:From]
    @mail.to = params[:headers][:To]
    @mail.subject = params[:headers][:Subject]
    @mail.body = params[:html] || params[:plain]

    if @mail.save
      render text: "success", status: 200
    else
      render text: "failed", status: 500
    end
  end

end
