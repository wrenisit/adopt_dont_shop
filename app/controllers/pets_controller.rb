class PetsController < ApplicationController
  def index
    if params[:shelter_id]
      @shelter = Shelter.find(params[:shelter_id])
      @pets = Pet.where(shelter_id: params[:shelter_id])
    else
    @pets = Pet.all
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end
end
