class ShopsController < ApplicationController

    before_action :set_shop, only: [:show, :edit, :update, :destroy]

    def index
        if params[:search_term]
            key = params["Search by"]
            @shops = Shop.where("#{key} like ?", "%#{params[:search_term].titleize}%")
            if @shops == []
                @shops = Shop.all
            end
        else
            @shops = Shop.all
        end
    end

    def show
    end
  
    def new
        @shop = Shop.new
    end
  
    def create
        @shop = Shop.new(shop_params)
    end
  
    private

    def set_shop
        @shop = Shop.find(params[:id])
    end
  
    def shop_params
        params.require(:shop).permit(:name, :location, :address)
    end
  
    def filtering_params(params)
        params.slice(:starts_with, :location)
    end

end
