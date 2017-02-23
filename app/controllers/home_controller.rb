class HomeController < ApplicationController
  def index
    @articles = Article.all
    @hints = Hint.all
  end
end
