class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[ show edit update destroy ]
  before_action :redirect_if_no_company

  def index
    @employees = current_user.company.employees.all
  end

  def show
  end

  def new
    @employee = current_user.company.employees.new
  end

  def edit
  end

  def create
    @employee = current_user.company.employees.new(employee_params)

    if @employee.save
      redirect_to employees_path, notice: "Employee was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @employee.update(employee_params)
      redirect_to employees_path, notice: "Employee was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_path, notice: "Employee was successfully destroyed."
  end

  private
    def set_employee
      @employee = current_user.company.employees.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :email, :phone_number)
    end
end
