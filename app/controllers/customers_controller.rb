class CustomersController < ApplicationController
  def index
    @customers = Customer.all.order("created_at")
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new

  end

  def create
    Customer.create(customer_params)
    redirect_to "/customers"
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    Customer.update(customer_params)
    redirect_to "/customers/#{@customer.id}"
  end

  private
    def customer_params
      params.permit(:name, :birth_year, :is_veteran)
    end
end