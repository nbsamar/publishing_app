class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:guest_index, :show]
  before_action :published_articles, :draft_articles

  def index

  end

  def update
    @article = Article.find(params[:id]).update(article_params)
    redirect_to root_path
    flash[:notice] = 'Article Updated'
  end

  def show
    @article = Article.find(params[:id])
  end

  def guest_index

  end

  def new

  end

  def create
    current_user.articles.create(article_params)
    redirect_to root_path
    flash[:notice] = 'Article Drafted'
  end

  def edit
    @article = Article.find(params[:id])
  end

  def publish
    Article.find(params[:article_id]).update(status: 1, publishing_user_id: current_user.id)
    redirect_to root_path
    flash[:success] = "Article Published!"
  end

  def unpublish
    Article.find(params[:article_id]).update(status: 0, unpublishing_user_id: current_user.id)
    redirect_to root_path
    flash[:success] = "Article Unpublished!"
  end

  def destroy

  end

  private

  def article_params
    params.require(:article).permit(:name, :content, :status)
  end

  def published_articles
    @published_articles = Article.where(status: 1)
  end

  def draft_articles
    @draft_articles = if current_user.nil?
                        nil
                      elsif current_user.reporter?
                        Article.where(status: 0, user_id: current_user)
                      else
                        Article.where(status: 0)
                      end
  end
end
