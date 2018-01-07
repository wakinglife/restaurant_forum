class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :dashboard, :favorite, :unfavorite, :like, :unlike]

  def index
     @restaurants = Restaurant.page(params[:page]).per(9)
     @categories = Category.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @comment = Comment.new(content: params[:comment])
  end

  def feeds
      @recent_restaurants = Restaurant.order(created_at: :desc).limit(10)
      @recent_comments = Comment.order(created_at: :desc).limit(10)
  end


  def dashboard
    @restaurant = Restaurant.find(params[:id])
  end

  def ranking
      @restaurants = Restaurant.order(favorites_count: :desc).limit(10)

  end

  def favorite
      @restaurant = Restaurant.find(params[:id])
      @restaurant.favorites.create!(user: current_user)
      favorites_count
      redirect_back(fallback_location: root_path)

  end


  def unfavorite
      @restaurant = Restaurant.find(params[:id])
      favorite = Favorite.where(restaurant: @restaurant, user: current_user)
      favorite.destroy_all
      favorites_count
      redirect_back(fallback_location: root_path)
  end

  def like
      @restaurant = Restaurant.find(params[:id])
      @restaurant.likes.create!(user: current_user)
      redirect_back(fallback_location: root_path)
  end

  def unlike
      @restaurant = Restaurant.find(params[:id])
      like = Like.where(restaurant: @restaurant, user: current_user)
      like.destroy_all
      redirect_back(fallback_location: root_path)
  end



private

   def set_restaurant
      @restaurant = Restaurant.find(params[:id])
   end

  def favorites_count
    @restaurant.favorites_count = @restaurant.favorited_users.count
    @restaurant.save!
  end


end
