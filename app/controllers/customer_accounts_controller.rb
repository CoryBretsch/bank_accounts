class CustomerAccountsController < ApplicationController 
  def index
    @customer = Customer.find(params[:customer_id])
    @accounts = @customer.accounts
  end
end