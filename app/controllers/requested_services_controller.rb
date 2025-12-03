class RequestedServicesController < ApplicationController
    before_action :set_requested_service, only: %i[ show edit destroy update ]
    before_action :redirect_if_no_company

  def index
    @requested_services = current_user.company.requested_services.all.includes(:customer, :service)
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
    @requested_service.customer.build_address(
      city: current_user.company.city,
      province: current_user.company.province,
      country: current_user.company.country
    )

  end

  def service_tiers
    service_id = params[:service_id] || params.dig(:requested_service, :service_id)
    @service = current_user.company.services.find_by(id: service_id)
    @tiers = @service ? @service.service_tiers : []
    respond_to do |format|
      format.turbo_stream
      format.html { render layout: false }
    end
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
    
    # Handle Tier Selection
    if requested_service_params[:service_tier_id].present?
      @requested_service.service_tier_id = requested_service_params[:service_tier_id]
    end
    
    # If no tier selected, or if user wants to override, we might have service_detail attributes.
    # But for now, let's rely on the model helpers to fall back.
    # If service_detail is built but empty, we might want to discard it?
    # The form sends service_detail_attributes.
    



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
      :requested_at, :is_confirmed, :is_completed, :service_id, :required_employees_count, :service_tier_id,
      employee_ids: [],
      customer_attributes: [
        :id, :first_name, :last_name, :email, :phone_number,
        address_attributes: [ :street, :city, :province, :postal_code, :country ]
      ],

    )
  end
  def complete_task
    if @requested_service.update(is_completed: true)
      redirect_to @requested_service, notice: "Service marked as completed."
    else
      redirect_to @requested_service, alert: "Could not complete the service."
    end
  end
end
