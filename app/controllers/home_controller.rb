class HomeController < ApplicationController
  def index
    @articles = Article.order(created_at: :desc).page(params[:page]).per(5)
    @hints = Hint.all
  end
end
