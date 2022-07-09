class PlantTagsController < ApplicationController
  def new
    @plant_tag = PlantTag.new
    @plant = Plant.find(params[:plant_id])
  end

  def create
    @plant_tag = PlantTag.new
    @tag = Tag.find(plant_params[:tag])
    @plant = Plant.find(params[:plant_id])

    @plant_tag.tag = @tag
    @plant_tag.plant = @plant

    if @plant_tag.save
      redirect_to garden_path(@plant.garden)
    else
      render :new
    end
  end

  private

  def plant_params
    params.require(:plant_tag).permit(:tag)
  end
end
