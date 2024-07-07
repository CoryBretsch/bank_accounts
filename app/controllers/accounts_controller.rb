class AccountsController < ApplicationController
  def index
    @accounts = Account.all
  end

  def show
    @accounts = Account.find(params[:id])
  end
end