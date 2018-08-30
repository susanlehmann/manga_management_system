class MangasController < ApplicationController
  before_action :get_manga, only: [:show]

  def index
    @mangas = Manga.order_manga
  end

  def show
    @chapters = @manga.chapters.order("LENGTH(name)").order(:name)
    @authors = @manga.authors.all
    @categories = @manga.categories.order(:name)
  end

  private
  def get_manga
    @manga = Manga.find_by id: params[:id]
    if @manga.nil?
      redirect_to root_url
    end
  end
end
