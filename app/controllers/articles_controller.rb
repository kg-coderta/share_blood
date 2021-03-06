class ArticlesController < ApplicationController
  before_action :authenticate_user!, except:[:index,:show] 

  def index
    @articles = Article.includes(user: :comments).page(params[:page]).per(6).order("created_at DESC")
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    
    if @article.save
      redirect_to root_path
    else
      redirect_back(fallback_location: new_article_path)
    end
  end

  def show
    @article = Article.find(params[:id])

  end
  
  def destroy
    @article = Article.find(params[:id])
    if @article.user_id == current_user.id
      @article.destroy
      redirect_to root_path
    else
      redirect_back(fallback_location: article_path)
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if article.user_id == current_user.id
      article.update(article_params)
    end
  end
  
  def fortune
  end

  private
  def article_params
    params.require(:article).permit(:text, :image, :title).merge(user_id: current_user.id)
  end
end
