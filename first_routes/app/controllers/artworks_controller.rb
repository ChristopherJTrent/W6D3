class ArtworksController < ApplicationController
    def index
        artworks = Artwork.artworks_for_user_id(params[:user_id])
        if artworks
            render json: artworks
        else
            render json: artworks.errors.full_messages, status: :unprocessable_entity
        end

    end
    def create
        artwork = Artwork.new(user_params)
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        artwork = Artwork.find_by(id: params[:id])
        if artwork 
            render json: artwork
        else
            render json: "{}"
        end
    end

    def destroy
        artwork = Artwork.find_by(id: params[:id])
        if artwork 
            artwork.destroy
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
        artwork = Artwork.find_by(id: params[:id])
        if artwork
            artwork.update(user_params)
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    private
    def user_params
        params.require(:artwork).permit(:artist_id, :title, :image_url)
    end
end
