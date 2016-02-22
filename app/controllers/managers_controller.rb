class ManagersController < ApplicationController
  before_action :set_manager, only: [:show, :edit, :update, :destroy]

  def index
    @managers = Manager.all
  end

  def show
  end

  def new
    @manager = Manager.new
  end

  def edit
  end

  def create
    @manager = Manager.new(manager_params)
    @manager.skip_confirmation!

    respond_to do |format|
      if @manager.save
        format.html { redirect_to @manager, notice: 'Manager was successfully created.' }
        format.json { render :show, status: :created, location: @manager }
      else
        format.html { render :new }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @manager.update(manager_params)
        format.html { redirect_to @manager, notice: 'Manager was successfully updated.' }
        format.json { render :show, status: :ok, location: @manager }
      else
        format.html { render :edit }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @manager.destroy
    respond_to do |format|
      format.html { redirect_to managers_url, notice: 'Manager was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_manager
    @manager = Manager.find(params[:id])
  end

  def manager_params
    params[:manager].permit(:email, :first_name, :last_name,
                            :phone_number, :address, :password,
                            :password_confirmation, :confirmed_at,
                            :restaurant_id)
  end
end
