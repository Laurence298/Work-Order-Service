class RequestedServicesController < ApplicationController
    before_action :set_product, only: %i[ show edit update ]

  def index
    @requested_services = RequestedService.all.includes(:customer, :service, :address)
    @tab = params[:tab] || "all"

    if @tab == "confirmed"
      @requested_services = @requested_services.where(status: "confirmed")
    elsif @tab == "pending"
      @requested_services = @requested_services.where(status: "pending")
    else
      @requested_services = @requested_services.where(status: [ "confirmed", "pending" ])
    end
  end
  def new
    @requested_service = RequestedService.new
    @requested_service.build_customer
    @requested_service.build_address
  end

  def show
    @requested_service = RequestedService.find(params[:id])
  end
  def edit
  end

  def update
    if @requested_service.update(requested_service_params)
      redirect_to requested_services_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @requested_service = RequestedService.new(requested_service_params)
    @requested_service.requested_at ||= Time.current  # fallback to now if blank

    if @requested_service.save
      redirect_to requested_services_path, notice: "Requested service created!"
    else
      render :new
    end
  end

  private
    def set_product
      @requested_service = RequestedService.find(params[:id])
    end

  def requested_service_params
    params.require(:requested_service).permit(
      :requested_at, :status, :service_id,
      customer_attributes: [ :name, :email, :phone_number ],
      address_attributes: [ :street, :city, :province, :postal_code, :country ]
    )
  end
end
