class CompaniesController  < ApplicationController
  def index
  end

  def new
    @company = Company.new
  end
  def show
    @company = current_user.company.find(params[:id])
  end

  def create
    @company = Company.new(company_params)
    @company.user = current_user
    if @company.save
      redirect_to root_path, notice: "Company registered successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @company = current_user.company
  end

  def update
    @company = current_user.company
    if @company.update(company_params)
      redirect_to root_path, notice: "Company settings updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

    def company_params
    params.require(:company).permit(:company_name, :city, :province, :country, :theme, :sidebar_color)
    end
end
