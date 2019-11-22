class PetsController < ApplicationController
  def index
    if params[:shelter_id]
      @shelter = Shelter.find(params[:shelter_id])
      @pets = @shelter.pets
    else
    @pets = Pet.all
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    Pet.create(pet_params)
    redirect_to "/shelters/#{params[:shelter_id]}/pets"
  end

  private

    def pet_params
      params.permit(:name, :age, :sex, :image, :description, :shelter_id)
    end
end
