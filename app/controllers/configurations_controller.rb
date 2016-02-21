class ConfigurationsController < ApplicationController
  before_action :set_configuration, only: [:create, :setup_seats]

  def create
    @configuration = SeatsConfiguration.new(configuration_params)

    respond_to do |format|
      if @configuration.save
        format.html { redirect_to @configuration, notice: 'Configuration was successfully created.' }
        format.json { render :show, status: :created, location: @configuration }
      else
        format.html { render :new }
        format.json { render json: @configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  def setup_seats
    seats = params.select { |key| key.to_s.include?("seat") }
    seat_info = seats.values.select { |values| values[:reserved] }

    seat_info.each do |seat|
      @configuration.seats.new(:x => seat[:x],
                               :y => seat[:y],
                               :reserved => false)
    end

    respond_to do |format|
      @configuration.save

      format.html { redirect_to @configuration.restaurant, notice: "Configuration has been set up." }
    end

  end

  private
  def set_configuration
    @configuration = SeatsConfiguration.find(params[:id] || params[:configuration_id])
  end

  def configuration_params
    params.require(:configuration).permit(:area, :restaurant_id)
  end
end
