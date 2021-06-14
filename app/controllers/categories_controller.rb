class CategoriesController < ApplicationController
  before_action :find_category, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new edit create destroy]

  def new
    @category = Category.new
  end

  def index
    @categories = Category.all.all.sort_by(&:priority).reverse
  end

  def show
    @articles = @category.articles
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_path(@category)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :priority)
  end

  def find_category
    @category = Category.find(params[:id])
  end
end
