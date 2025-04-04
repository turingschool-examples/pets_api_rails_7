class Api::V1::PetsController < ApplicationController
  def index
    pets = Pet.all
    render json: pets
  end

  def show
    pet = Pet.find(params[:id])
    render json: pet
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Pet not found" }, status: :not_found
  end

  def create
    pet = Pet.new(pet_params)
    if pet.save
      render json: pet, status: :created
    else
      render json: { errors: pet.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    pet = Pet.find(params[:id])
    if pet.update(pet_params)
      render json: pet
    else
      render json: { errors: pet.errors.full_messages }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Pet not found" }, status: :not_found
  end

  def destroy
    pet = Pet.find(params[:id])
    pet.destroy
    head :no_content
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Pet not found" }, status: :not_found
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :animal_type, :age)
  end
end
