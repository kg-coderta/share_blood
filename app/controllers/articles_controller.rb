class ArticlesController < ApplicationController

  def index
    @articles = Article.includes(:user).page(params[:page]).per(6).order("created_at DESC")
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    if @article.save
      redirect_to root_path
    else
      redirect_back(fallback_location: new_article_path)
    end
  end

  def show
  end
  


  private
  def article_params
    params.require(:article).permit(:text, :image, :title).merge(user_id: current_user.id)
  end
end
