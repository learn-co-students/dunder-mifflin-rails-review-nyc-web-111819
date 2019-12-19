class DogsController < ApplicationController

    def index
        @dogs = Dog.all.sort {|a, b| b.employee_count <=> a.employee_count}
    end

    def show
        @dog = Dog.find(params[:id])
    end

end
