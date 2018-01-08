class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user

    respond_to do |format|
      if @review.save
        flash[:success] = "Review was successfully created."
        format.html { redirect_to @review.product }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        flash[:success] = "Review was successfully updated."
        format.html { redirect_to @review }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      flash[:danger] = "Review was successfully deleted."
      format.html { redirect_to @review.product }
      format.json { head :no_content }
    end
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:comment, :product_id, :user_id)
    end

    def require_same_user
      if current_user != @review.user and !current_user.admin?
        flash[:danger] = 'You can only edit or delete your own article'
        redirect_to root_path
      end
    end
end
