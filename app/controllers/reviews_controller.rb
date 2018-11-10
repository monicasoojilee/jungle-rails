class ReviewsController < ApplicationController

    before_filter :authorize

    def create
        @product = Product.find(params[:product_id]) 
        @review = Review.new(:product_id => params[:product_id],
                             :description => params[:review][:description],
                             :rating => params[:rating])
        @review.user_id = current_user.id
        @review.save!
       if @review.save
            redirect_to @product, notice: 'Review submitted!'
        else
            redirect_to @product, notice: 'Review failed to submit!'
        end
    end

    def destroy
        @product = Product.find(params[:product_id])
        @review = Review.find_by(product_id: @product.id, user_id: current_user.id)
        @review.destroy
        redirect_to @product, notice: 'Comment deleted!'
      end

    private
    def review_params
        params.require(:review).permit(:product_id, :description, :rating)
    end
end
