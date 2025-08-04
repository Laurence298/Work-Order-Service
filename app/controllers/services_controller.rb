class ServicesController < ApplicationController
  before_action :set_service, only: %i[ show edit update destroy ]

  def index
    @services = Service.all
  end
  def show
  end

  def new
    @service = Service.new
  end
  def edit
  end
  def update
    if @service.update(service_params)
      redirect_to @service
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to services_path, notice: "Service was successfully created."
    else
      render :new, notice: "Failed to create service."
    end
  end


  def destroy
    @service.destroy
    redirect_to services_path
  end

  private
  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:name, :description)
  end
end
