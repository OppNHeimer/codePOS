class ApplicationController < ActionController::Base
  before_action :get_orders
  protect_from_forgery with: :exception

  def get_orders
    @modifications = ['blah','di','da']
    @orders = Order.all
  end


end
