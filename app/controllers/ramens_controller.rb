class RamensController < ApplicationController

    before_action :set_ramen, only: [:show, :edit, :update, :destroy]


    def index
        @ramens = Ramen.all
    end

    def show
    end

    private

    def set_ramen
        @ramen = Ramen.find(params[:id])
    end
  
    def ramen_params
        params.require(:ramen).permit(:name, :price, :image_url, :shop_id)
    end

end
