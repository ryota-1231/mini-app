class ArticlesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]


  def index
    @articles = Article.includes(:user).order("created_at DESC").page(params[:page]).per(4)
    
  end

  def new
    @post = Article.new
  end
  
  def create
    Article.create(title: article_params[:title], image: article_params[:image],text: article_params[:text], user_id: current_user.id)
    
  end

  def destroy
    articles = Article.find(params[:id])
    articles.destroy if articles.user_id == current_user.id
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.update(article_params) if article.user_id == current_user.id
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.includes(:user)
  end


  private
  def article_params
    params.permit(:title, :image, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

 

end
