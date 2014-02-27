class PreordersController < ApplicationController
  def show
    @preorder = Preorder.new
  end

  def create
    @preorder = Preorder.new preorder_params
    if @preorder.save
      redirect_to preorder_path, flash: { notice: "Your order has been processed.  Thanks!" }
    else
      flash[:error] = "Something went wrong."
      render "show"
    end
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
