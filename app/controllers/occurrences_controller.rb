class OccurrencesController < ApplicationController

  def index
    @occurrences = Occurrence.all
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
