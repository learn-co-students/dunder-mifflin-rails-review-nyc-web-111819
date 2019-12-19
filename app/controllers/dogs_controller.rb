class DogsController < ApplicationController
  before_action :find_dog, only: [:edit, :show, :update]

  def index
    @dogs = Dog.all
  end

  def show

  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.create(dog_params)
    if @dog.valid?
      redirect_to dogs_path
    else
      flash[:messages] = @dog.errors.full_messages
      redirect_to edit_dog(@dog)
    end
  end

  def edit
    
  end

  def update
    @dog.update(dog_params)
    redirect_to dog_path(@dog)
  end

  private

  def find_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :breed, :age)
  end
end
