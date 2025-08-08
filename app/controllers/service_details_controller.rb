class ServiceDetailsController < ApplicationController
  before_action :set_service

  def create
    @service_detail = @service.service_details.new(service_detail_params)
    if @service_detail.save
      redirect_to @service, notice: "Plan added successfully."
    else
      # Ensure @service_details is set for the view
      @service_details = @service.service_details
      render "services/show", status: :unprocessable_entity, alert: "Failed to add plan."
    end
  end

  private

  def set_service
    @service = Service.find(params[:service_id])
  end

  def service_detail_params
    params.require(:service_detail).permit(:service_plan, :features, :price)
  end
end
