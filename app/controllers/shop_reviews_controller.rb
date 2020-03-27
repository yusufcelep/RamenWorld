class ShopReviewsController < ApplicationController

    before_action :set_shop_review, only: [:show, :edit, :update, :destroy]

    def index
        @shop_reviews = @current_user.shop_reviews
    end

    def show
    end

    def new
        @shop_review = ShopReview.new
    end

    def edit
    end

    def create
        shop_review = ShopReview.create(shop_review_params.merge(user_id: @current_user.id))
        if shop_review.valid?
            redirect_to shop_review_path(shop_review)
        else
            flash[:errors] = shop_review.errors.full_messages
            redirect_to new_shop_review_path
        end
    end

    def update
        @shop_review.update(shop_review_params)
        if @shop_review.valid?
            redirect_to shop_reviews_path
        else
            flash[:errors] = @shop_review.errors.full_messages
            redirect_to edit_shop_review_path
        end
    end

    def destroy
        @shop_review.destroy
        redirect_to shop_reviews_path
    end

    private

    def set_shop_review
        @shop_review = ShopReview.find(params[:id])
    end
  
    def shop_review_params
        params.require(:shop_review).permit(:user_id, :shop_id, :rating, :review)
    end

end
