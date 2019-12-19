class EmployeesController < ApplicationController

    before_action :find_employee, only: [:show, :edit, :update]

    def welcome
    end

    def index
        @employees = Employee.all
    end 

    def show
    end 

    def new
        @dogs = Dog.all
        @employee = Employee.new
    end

    def create
        @employee = Employee.create(employee_params)
        if @employee.valid?
        redirect_to employee_path(@employee)
        else 
            flash[:messages] = @employee.errors.full_messages
            redirect_to new_employee_path(@employee)
        end
    end 

    def edit
        @dogs = Dog.all
    end 

    def update
        @employee.update(employee_params)
        if @employee.valid?
        redirect_to employee_path(@employee)
        else
            flash[:messages] = @employee.errors.full_messages
            redirect_to edit_employee_path(@employee)
        end
    end 

    private 

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end 

    def find_employee
        @employee = Employee.find(params[:id])
    end
end

