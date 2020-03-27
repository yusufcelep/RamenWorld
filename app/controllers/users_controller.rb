class UsersController < ApplicationController

    before_action :set_user, only: [:show, :edit, :update, :destroy]
    skip_before_action :authenticated, only: [:new, :create]
  
    def show
    end
  
    def new
        @user = User.new
    end

    def edit
    end
  
    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def update
        @user.update(user_params)
        if @user.valid?
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to edit_user_path(@user)
        end
    end

    def destroy
        @user.destroy
        render new_user_path
    end
  
    private
  
    def set_user
        @user = User.find(params[:id])
    end
  
    def user_params
        params.require(:user).permit(:username, :password, :first_name, :last_name, :photo_url)
    end

end
