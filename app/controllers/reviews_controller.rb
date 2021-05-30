class ReviewsController < ApplicationController
  before_action :find_article
  before_action :find_review, only: %i[edit update destroy]
  before_action :authenticate_user!, only: %i[new edit create destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.article_id = @article.id
    @review.user_id = current_user.id

    if @review.save
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @review.update(review_params)
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    redirect_to article_path(@article)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def find_article
    @article = Article.find(params[:article_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
