class PreordersController < ApplicationController
  def show
    @preorder = Preorder.new
  end

  def create

    @preorder = Preorder.new preorder_params
    unless @preorder.save
      flash[:error] = "Something went wrong."
      render "show"
    end

    # in cents
    @amount = 12900

    customer = Stripe::Customer.create(
      email: params[:email],
      card: 'thisisabadtoken' # params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: "Kit preorder from #{params[:first_name]} #{params[:last_name]}",
      currency: 'usd'
    )


    redirect_to preorder_path, flash: { notice: "Your order has been processed.  Thanks!" }

  rescue Stripe::CardError => e
    @preorder.delete # delete the preorder
    flash[:error] = e.message
    render "show"
  end

  private

    def preorder_params
      params.require(:preorder).permit(
        :first_name,
        :last_name,
        :email,
        :address,
        :city,
        :state,
        :zipcode,
        :strip_customer_id #Not right but this is for you Ryan.
      )
    end
end
