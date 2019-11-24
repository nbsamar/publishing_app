class ArticlesController < ApplicationController
  before_action :authenticate_user, except: [:guest_index]
  before_action :published_articles

  def index
    @draft_articles = if current_user.reporter?
                        Article.where(status: 0, user_id: current_user)
                      else
                        Article.where(status: 0)
                      end
  end

  def guest_index

  end

  def create

  end

  def edit

  end

  def publish

  end

  def destroy

  end

  private

  def published_articles
    @published_articles = Article.where(status: 1)
  end

  def draft_articles
    @draft_articles = Article.where(status: 0)
  end
end
