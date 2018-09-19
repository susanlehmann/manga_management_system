class SearchesController < ApplicationController
  def index
    @q = Manga.search(params[:q])
    @mangas = @q.result(distinct: true)
    @categories = Category.all.order(:name)
  end
end
