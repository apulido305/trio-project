# @Author: timaanonsen
# @Date:   01-08-2018 16:01::74
# @Filename: charges_controller.rb
# @Last modified by:   timaanonsen
# @Last modified time: 01-08-2018 16:01::74



class ChargesController < ApplicationController

  def new
  end

  def create
    @products = Product.all
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    flash[:success] = "Thank you! We're processing your order and will send you an email confirmation shortly."
    redirect_to products_url

    # respond_to do |format|
    #   if @amount.save
    #     flash[:success] = "Product was successfully created."
    #     format.html { redirect_to products_url }
    #     format.json { render :show, status: :created, location: @product }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @product.errors, status: :unprocessable_entity }
    #   end
    # end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    # redirect_to new_charge_path
  end

end
