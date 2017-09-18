class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  $order = [{item: 'burger', modification: 'add cheese', message: 'we love the kitchen'}, {item: 'veggie pizza', modification: 'no olives'}]
end
