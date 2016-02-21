class GuestsController < ApplicationController
  before_action :set_guest, only: [:show, :edit, :update, :destroy]
  before_action :set_guests, :only => [:show]

  def index
    @guests = Guest.all
  end

  def show
    @friendships = current_user.friendships
  end

  def edit
  end

  def update
    respond_to do |format|
      if @guest.update(guest_params)
        format.html { redirect_to @guest, notice: 'Guest was successfully updated.' }
        format.json { render :show, status: :ok, location: @guest }
      else
        format.html { render :edit }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_guest
    @guest = Guest.find(params[:id])
  end

  def set_guests
    if params[:search]
      @guest_search = Guest.search(params[:search])
    end
  end

  def guest_params
    params.require(:guest).permit(:first_name, :last_name, :phone_number, :address, :email)
  end
end
