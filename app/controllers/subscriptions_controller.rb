class SubscriptionsController < ApplicationController

  before_filter :authenticate_user!

def new
end

def update
  token = params[:stripeToken]

    customer = Stripe::Customer.create(
      card: token,
      plan: 0001,
      email: current_user.email
      )

    current_user.subscribe = true
    current_user.stripeid = customer.id
    current_user.save

    redirect_to article_path
  end
end
