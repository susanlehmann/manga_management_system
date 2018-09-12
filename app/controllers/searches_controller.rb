class SearchesController < ApplicationController
  def index
    @q = Manga.search(params[:q])
    @mangas = @q.result(distinct: true)
  end
end
