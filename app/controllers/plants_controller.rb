class PlantsController < ApplicationController
    def index
        plants  = Plant.all
        render json: plants
    end

    # Post /plants
    def create 
        # Create new Plant
        plant = Plant.create(plant_params)
        if plant
            render json: plant, status: :created
        else
            render json: {
                err: "failed to Add Plant"
            },
            status: :unauthorized
        end
    end

    def show
        plant = Plant.find_by(id: params[:id])

        # Check if the Id exist
        if plant
            render json: plant

        else
            render json: {
                err: "Plant not found"
            },
            status: :not_found
        end
    end
    private 

    def plant_params
        params.permit(:name, :image, :price, )
    end
end