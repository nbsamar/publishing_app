class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:guest_index]
  before_action :published_articles, :draft_articles

  def index

  end

  def guest_index

  end

  def create

  end

  def edit

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
