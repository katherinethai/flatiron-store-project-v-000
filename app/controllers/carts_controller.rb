require 'pry'
class CartsController < ApplicationController
  def show
    @current_cart = Cart.find(params[:id])
  end

  def checkout
    cart = Cart.find(params[:id])
    cart.line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
    cart.line_items.clear
    cart.status = 'submitted'
    current_user.remove_cart
    redirect_to cart_path(cart)
  end
end
