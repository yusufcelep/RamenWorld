class RecommendationsController < ApplicationController

    before_action :set_recommendation, only: [:show, :edit, :update, :destroy]

    def index
        @recommendations = @current_user.recommendations
    end

    def show
    end

    def new
        @recommendation = Recommendation.new
    end

    def edit
    end

    def create
        recommendation = Recommendation.create(recommendation_params.merge(user_id: @current_user.id))
        if recommendation.valid?
            redirect_to recommendations_path
        else
            flash[:errors] = recommendation.errors.full_messages
            redirect_to new_recommendation_path
        end
    end

    def update
        @recommendation.update(recommendation_params)
        if @recommendation.valid?
            redirect_to recommendations_path
        else
            flash[:errors] = @recommendation.errors.full_messages
            redirect_to edit_recommendation_path
        end
    end

    def destroy
        @recommendation.destroy
        redirect_to recommendations_path
    end
  
    private
      
    def set_recommendation
        @recommendation = Recommendation.find(params[:id])
    end
  
    def recommendation_params
        params.require(:recommendation).permit(:user_id, :ramen_id, :comments)
    end

end
