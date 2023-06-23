class SpicesController < ApplicationController
    wrap_parameters format: []

    def index 
        spices=Spice.all
        render json:spices
    end 

    def create 
        spice= Spice.create(spice_params)
        if spice
            render json:spice ,status: :created
        else
            render json: {error: "Spice not found"}, status: :not_found
        end
    end

    def update
        spice=Spice.find_by(id: params[:id])
        if spice 
            spice.update(spice_params)
            render json: spice ,status: :accepted
        else
            render json: {error: "Spice not found"}, status: :not_found
        end         
            
    end

    def destroy
        spice=Spice.find_by(id: params[:id])
        if spice
            spice.destroy
        else 
            render json: {error: "Spice not found"}, status: :not_found
        end
    end

    private 
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end



end
