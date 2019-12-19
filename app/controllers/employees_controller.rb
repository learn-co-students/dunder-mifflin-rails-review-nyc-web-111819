class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end
    def show
        @employee = Employee.find(params['id'])
    end
    def new
        @employee = Employee.new
    end
    def create
        @employee = Employee.new(employee_params)
        if @employee.valid?
            @employee.save
            redirect_to employee_path(@employee)
        else
            render :new
        end
    end
    def edit
        @employee = Employee.find(params['id'])
    end
    def update
        @employee = Employee.update(params['id'], employee_params)
        if @employee.valid?
            redirect_to employee_path(@employee)
        else
            render :edit
        end
    end
    def delete
        Employee.find(params['id']).destroy
        redirect_to employee_path()
    end
    private
    def employee_params
        params.require('employee').permit(['first_name','last_name','alias','title','office','img_url','dog'])
    end
end
