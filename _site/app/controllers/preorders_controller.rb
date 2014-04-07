class PreordersController < ApplicationController
  def show
    @preorder = Preorder.new
  end

  def create
    # in cents
    @amount = 14900

    customer = Stripe::Customer.create(
      email: params[:email],
      card: params[:stripeToken]
    )

    @preorder = Preorder.new preorder_params
    @preorder.stripe_customer_id = customer.id
    unless @preorder.save
      flash[:error] = "Something went wrong."
      render "show" and return
    end

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
        :zipcode
      )
    end
end
