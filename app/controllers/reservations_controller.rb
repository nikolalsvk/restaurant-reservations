class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :set_restaurant, :only => [:create]

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    seats = params.select { |key| key.to_s.include?("seat") }
    seat_info = seats.values.select { |values| values[:reserved] }

    if seat_info.empty?
      redirect_to @restaurant, alert: 'You have to choose a table first'
    else
      ActiveRecord::Base.transaction do
        @reservation = Reservation.new(:date => reservation_params[:date],
                                       :duration => reservation_params[:duration][0],
                                       :user_id => current_user.id)

        seat_info.each do |seat|
          seat = Seat.where(:x => seat[:x],
                            :y => seat[:y]).first

          seat.with_lock do
            seat.reservations << @reservation

            unless seat.save
              redirect_to @restaurant, :alert => @reservation.errors and return
            end
          end
        end
        redirect_to @restaurant, notice: 'Reservation was successfully created.' and return
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @restaurant, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { redirect_to @restaurant }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:date, :duration)
    end
end
