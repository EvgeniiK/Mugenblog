class HomeController < ApplicationController
  def index
    @articles = Article.page params[:page]
    @hints = Hint.all
  end
end
