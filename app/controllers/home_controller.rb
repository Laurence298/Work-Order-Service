class HomeController < ApplicationController
  before_action :redirect_if_no_company

  def index
    @confimed_schedule = current_user.company.requested_services.where(is_confirmed: true).order(requested_at: :desc)
  end
end
