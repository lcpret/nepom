class OccurrencesController < ApplicationController

  def index
    if params[:query_ship]
      @occurrences = Occurrence.search_by_ship(params[:query_ship])
    else
      @occurrences = Occurrence.all
    end

    # @markers = @occurrences.map do |occurrence|
    #   {
    #     lat: occurrence.latitude,
    #     lng: occurrence.longitude,
    #     info_window: render_to_string(partial: "info_window", locals: { occurrence: occurrence })
    #   }
    # end
  end

  def show
    @occurrence = Occurrence.find(params[:id])
  end

  def new
    @occurrence = Occurrence.new
  end

  def create
    @occurrence = Occurrence.new(occurrence_params)
    @occurrence.user = current_user
    if @occurrence.save
      redirect_to occurrences_path, notice: 'Occurrence was successfully created!'
    else
      render :new
    end
  end

  private
  def occurrence_params
    params.require(:occurrence).permit(
      :ship_id, :latitude, :longitude, :date, :time, :ship_origin, :ship_destination, :user_id, :description
    )
  end
end
