class CustomersController < ApplicationController
  before_action :redirect_if_no_company
  def index
    @customers = Customer.all
  end
  def new
    @customer = Customer.new
  end
end
