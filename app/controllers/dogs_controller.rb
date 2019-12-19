class DogsController < ApplicationController
    def index
        @dogs = Dog.all
    end
    def show
        @dog = Dog.find(params['id'])
        @owners = Employee.select{|m| m.dog == @dog.name}
    end
    def new
        @dog = Dog.new
    end
    def create
        @dog = Dog.new(dog_params)
        if @dog.valid?
            redirect_to dog_path(@dog)
        else
            render :new
        end
    end
    def edit
        @dog = Dog.find(params['id'])
    end
    def update
        @dog = Dog.update(dog_params['id'], dog_params)
        if @dog.valid?
            redirect_to dog_path(@dog)
        else
            render :edit
        end
    end
    def delete
        Dog.find(params['id']).destroy
        redirect_to dog_path()
    end
    private
end
