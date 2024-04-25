class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cart, :current_order

  private

  def initialize_session
    session[:shopping_cart] ||= []
    session[:current_order_id] ||= nil
  end

  def cart
    Product.find(session[:shopping_cart])
  end

  def current_order
    @current_order ||= Order.find_by(id: session[:current_order_id]) || Order.new
  end
end
