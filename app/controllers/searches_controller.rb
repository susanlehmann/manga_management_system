class SearchesController < ApplicationController
  def index
    @q = Manga.search(params[:q])
    @categories = Category.all.order(:name)
  end
end
