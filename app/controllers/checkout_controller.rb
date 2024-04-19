class CheckoutController < ApplicationController

  def create
    # Establish connection with Stripe and redirect user to the payment screen
    product_ids = session[:shopping_cart]
    @products = Product.where(id: product_ids)

    if @products.empty?
      redirect_to root_path
      return
    end

    line_items = @products.map do |product|
      {
        quantity: 1,
        price_data: {
          unit_amount: (product.price* 100).to_i,
          currency: "cad",
          product_data: {
            name: product.name,
            description: product.description
          }
        }
      }
    end

    line_items << {
      quantity: 1,
      price_data: {
        currency: "cad",
        unit_amount: (@products.sum { |product| product.price * 100 } * 0.05).to_i,
        product_data: {
          name: "GST",
          description: "Goods and Services Tax"
        }
      }
    }

    line_items << {
      quantity: 1,
      price_data: {
        currency: "cad",
        unit_amount: (@products.sum { |product| product.price * 100 } * 0.07).to_i,
        product_data: {
          name: "PST",
          description: "Provincial Sales Tax"
        }
      }
    }

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      success_url: checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: checkout_cancel_url,
      mode: "payment",
      line_items: line_items
    )

    redirect_to @session.url, allow_other_host: true
  end

  def success
    #success payment
    session_id = params[:session_id]
    @session = Stripe::Checkout::Session.retrieve(session_id)
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  def cancel
    #cancel transaction process
  end

end
