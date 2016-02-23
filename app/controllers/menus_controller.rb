class MenusController < ApplicationController
  before_action :set_restaurant, only: [:show, :create, :edit, :update, :destroy]
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @menu = Menu.new
  end

  def edit
  end

  def create
    @menu = @restaurant.build_menu(menu_params)

    respond_to do |format|
      if @menu.save
        format.html { redirect_to restaurant_path(@restaurant), notice: 'Menu was successfully created.' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to restaurant_path(@restaurant), notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_path(@restaurant), notice: 'Menu was successfully destroyed.' }
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

  def menu_params
    params.require(:menu).permit(:title, :description, :restaurant_id)
  end
end
