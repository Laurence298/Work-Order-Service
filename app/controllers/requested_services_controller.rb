class RequestedServicesController < ApplicationController
    before_action :set_requested_service, only: %i[ show edit destroy update ]
    before_action :redirect_if_no_company

  def index
    @requested_services = current_user.company.requested_services.all.includes(:customer, :service, :service_detail)
    @tab = params[:tab] || "all"

    if @tab == "confirmed"
      @requested_services = @requested_services.where(is_confirmed: true)
    elsif @tab == "pending"
      @requested_services = @requested_services.where(is_confirmed: false)
    else
      @requested_services = @requested_services.order(requested_at: :desc)
    end
  end
  def new
    @requested_service = current_user.company.requested_services.new
    @requested_service.build_customer
    @requested_service.customer.build_address
    @requested_service.build_service_detail
  end

  def show
  end
  def edit
  end

  def destroy
    @requested_service.destroy
    redirect_to requested_services_path
  end

  def update
    if @requested_service.update(requested_service_params)
      redirect_to requested_services_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @requested_service = current_user.company.requested_services.new(requested_service_params)
    @requested_service.customer.company = current_user.company
    @requested_service.service_detail.service_id = @requested_service.service.id if @requested_service.service_detail


    if @requested_service.save
      redirect_to requested_services_path, notice: "Requested service created!"
    else
      logger.debug @requested_service.errors.full_messages

      render :new
    end
  end

  private
    def set_requested_service
      @requested_service = current_user.company.requested_services.find(params[:id])
    end

  def requested_service_params
    params.require(:requested_service).permit(
      :requested_at, :is_confirmed, :is_completed, :service_id,
      customer_attributes: [
        :first_name, :last_name, :email, :phone_number,
        address_attributes: [ :street, :city, :province, :postal_code, :country ]
      ],
      service_detail_attributes: [ :service_plan, :description, :price ]
    )
  end
end
