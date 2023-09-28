class ArtworksController < ApplicationController
    def index
        artworks = Artwork.all
        render json: artworks
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
        artwork = Artwork.find(params[:id])
        render json: artwork
    end

    def update 
        artwork = Artwork.find(params[:id])

        if artwork.update(user_params)
            redirect_to user_url(artwork)
        else
            render artwork.errors.full_messages, status: 422
        end

    end

    def destroy 
        artwork = Artwork.find_by(id: params[:id])

        if artwork && artwork.destroy
            redirect_to users_url
        else
            render json: {'error': "Artwork doesn't exist"}, status: 404
        end

    end

    private
    def artwork_params
        params.require(:artwork).permit(:username)
    end
end
