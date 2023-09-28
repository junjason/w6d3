class ArtworksController < ApplicationController
    def index
        artworks = Artwork.all
        render json: artworks
    end

    def create
        artwork = Artwork.new(artwork_params)
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

        if artwork.update(artwork_params)
            redirect_to artwork_url(artwork)
        else
            render artwork.errors.full_messages, status: 422
        end

    end

    def destroy 
        artwork = Artwork.find_by(id: params[:id])

        if artwork && artwork.destroy
            redirect_to artworks_url
        else
            render json: {'error': "Artwork doesn't exist"}, status: 404
        end

    end

    private
    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end
