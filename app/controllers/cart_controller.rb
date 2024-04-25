class CartController < ApplicationController

  def create
    logger.debug("adding #{params[:id]} to cart.")
    id = params[:id].to_i
    #session[:shopping_cart] = [] unless session[:shopping_cart].empty? ---deletes session
    session[:shopping_cart] << id unless session[:shopping_cart].include?(id)
    product = Product.find(id)
    flash[:notice] = "+ #{product.name} added to cart."
    redirect_back(fallback_location: root_path)
  end

  def destroy
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    product = Product.find(id)
    flash[:notice] = "- #{product.name} removed from cart."
    redirect_back(fallback_location: root_path)
  end

  def update
    cart = session[:shopping_cart] || []
    cart.each do |item_id|
      quantity = params["quantity_#{item_id}"].to_i
      order_item = OrderItem.find_or_initialize_by(product_id: item_id, order_id: current_order.id)
      order_item.quantity = quantity
      order_item.save
    end
    flash[:notice] = "Cart updated successfully"
    redirect_back(fallback_location: root_path)
  end

end
