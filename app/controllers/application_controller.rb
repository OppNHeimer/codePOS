class ApplicationController < ActionController::Base
  before_action :get_orders
  protect_from_forgery with: :exception

  $modifications = []
  def get_orders
    @orders = Order.all
  end


end
