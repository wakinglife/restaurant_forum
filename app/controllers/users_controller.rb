class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]


  def index

    @users = User.all

  end


  def show

    @commented_restaurants = @user.restaurants.uniq
    @favorited_restaurants = @user.restaurants
    @followings = @user.followings
    @followers = @user.followers
  end

  def edit

     unless @user == current_user
       redirect_to user_path(@user)
     end
  end


  def update


     if @user.update_attributes(user_params)
       redirect_to user_path(@user)
     else
       render :action => :edit
     end
  end


  private

     def set_user
        @user = User.find(params[:id])
      end

     def user_params
       params.require(:user).permit(:name, :intro, :avatar)
     end



end
