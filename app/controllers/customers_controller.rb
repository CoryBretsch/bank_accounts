class CustomersController < ApplicationController
  def index
    @customers = Customer.all.order("created_at")
  end

  def show
    @customer = Customer.find(params[:id])
  end
end