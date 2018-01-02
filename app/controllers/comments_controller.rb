class CommentsController < ApplicationController
  def create
       @restaurant = Restaurant.find(params[:restaurant_id])
       @comment = @restaurant.comments.build(comment_params)
       @comment.user = current_user
      # @comment.save!
      # redirect_to restaurant_path(@restaurant)
      if @comment.save
        flash[:notice]= "Message saved"
        redirect_to restaurant_path(@restaurant)
      else
        flash.now[:alert]= @comment.errors.full_messages.each{|msg| msg.class}
        @restaurant = Restaurant.find(params[:restaurant_id])
        redirect_to restaurant_path(@restaurant, comment_params)
      end

    end

    def destroy
        @restaurant = Restaurant.find(params[:restaurant_id])
        @comment = Comment.find(params[:id])

        if current_user.admin?
          @comment.destroy
          redirect_to restaurant_path(@restaurant)
        end
      end


    private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
