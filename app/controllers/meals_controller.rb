class MealsController < ApplicationController
  before_action :set_restaurant
  before_action :set_menu, only: [:new, :show, :edit, :update, :destroy]
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @meal = Meal.new
  end

  def edit
  end

  def create
    @meal = Meal.new(meal_params)

    respond_to do |format|
      if @meal.save
        format.html { redirect_to restaurant_path(@restaurant), notice: 'Meal was successfully created.' }
        format.json { render :show, status: :created, location: @meal }
      else
        format.html { render :new }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @meal.update(meal_params)
        format.html { redirect_to restaurant_path(@restaurant), notice: 'Meal was successfully updated.' }
        format.json { render :show, status: :ok, location: @meal }
      else
        format.html { render :edit }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @meal.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_path(@restaurant), notice: 'Meal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_menu
    @menu = @restaurant.menu
  end

  def set_restaurant
    if current_user.manager?
      @restaurant = current_user.restaurant
    else
      @restaurant = Restaurant.find(params[:restaurant_id])
    end
  end

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:title, :description, :price, :menu_id)
  end
end
