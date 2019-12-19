class DogsController < ApplicationController

  before_action :find_dog, only: [:show, :edit, :update]

  def index
    @dogs = Dog.all
  end

  def show
  end

  def new
    @dog = Dog.new
  end

  def create
    dog = Dog.create(dog_params)
    if dog.valid?
      redirect_to dog_path(dog)
    else
      flash[:messages] = dog.errors.full_messages
      redirect_to new_dog_path
    end
  end

  def edit
  end

  def update
    if @dog.update(dog_params)
      redirect_to dog_path(@dog)
    else
      flash[:messages] = @dog.errors.full_messages
      redirect_to edit_dog_path(@dog)
    end
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :age)
  end

  def find_dog
    @dog = Dog.find(params[:id])
  end

end
