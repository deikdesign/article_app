class ArticlesController < ApplicationController
  before_action :find_article, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new edit]

  def index
    if params[:category].blank?
      @articles = Article.all.order('created_at DESC')
    else
      @category_id = Category.find_by(name: params[:category]).id
      @articles = Article.where(category_id: @category_id).order('created_at DESC')
    end
  end

  def show; end

  def new
    @article = current_user.articles.build
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def create
    @article = current_user.articles.build(article_params)
    @article.category_id = params[:category_id]
    @categories = Category.all.map { |c| [c.name, c.id] }

    if @article.save
      redirect_to root_path

    else

      render 'new'
    end
  end

  def edit
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def update
    @article.category_id = params[:category_id]
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  def upvote
    @article = Article.find(params[:id])
    @article.upvote_from current_user
    redirect_to article_path(@article)

end

def downvote
    @article = Article.find(params[:id])
    @article.downvote_from current_user
    redirect_to article_path(@article)
end


  private

  def article_params
    params.require(:article).permit(:title, :description, :author, :category_id, :article_img)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
