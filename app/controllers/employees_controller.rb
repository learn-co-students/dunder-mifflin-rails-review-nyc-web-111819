class EmployeesController < ApplicationController
  
  before_action :find_employee, only: [:show, :edit, :update]
  
  def index
    @employees = Employee.all
  end

  def show
    # @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
    @dogs = Dog.all.sort { |a, b| a.name <=> b.name }
  end

  def create
    employee = Employee.create(employee_params)

    # VALIDATIONS
    if employee.valid?
      redirect_to(employee_path(employee))
    else
      flash[:messages] = employee.errors.full_messages
      redirect_to(new_employee_path)
    end

  end

  def edit
    # @employee = Employee.find(params[:id])
    @dogs = Dog.all.sort { |a, b| a.name <=> b.name }
  end

  def update
    # @employee = Employee.find(params[:id])

    # VALIDATIONS 

    @employee.update(employee_params)
    redirect_to(employee_path(@employee))
  end

  private

  def find_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
  end

end
