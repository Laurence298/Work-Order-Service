class HomeController < ApplicationController
  before_action :redirect_if_no_company

  def index
  end
end
