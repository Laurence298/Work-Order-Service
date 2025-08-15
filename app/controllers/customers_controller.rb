class CustomersController < ApplicationController
  before_action :redirect_if_no_company
  def index
    @customers = current_user.company.customer.all
  end
  def new
    @customer = current_user.company.customer.new
  end
end
