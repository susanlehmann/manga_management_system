class MangasController < ApplicationController
  before_action :get_manga, only: [:show]

  def index
    @mangas = Manga.order_manga.paginate page: params[:page], per_page: Settings.mangas.page
    if params[:search].present?
      @mangas = Manga.search(name_cont: params[:search]).result
      if params[:scope].present?
        check_scope.search(name_cont: params[:search]).result
      end
    else
      if params[:scope].present?
        check_scope
      end
    end
  end

  def show
    @chapters = @manga.chapters.reverse
    @authors = @manga.authors.all
    @categories = @manga.categories.order(:name)
    @supports = Supports::Manga.new @manga
    @comment = Comment.new
    @comments = @manga.comments.hash_tree
    Manga.increment_counter(:number_of_read, @manga.id)
  end

  private
  def get_manga
    @manga = Manga.friendly.find(params[:id])
    redirect_to root_url unless @manga
  end

  def check_scope
    @mangas = case params[:scope]
    when Settings.mangas.most_view
      Manga.most_view
    when Settings.mangas.top_rate
      Manga.top_rate
    when Settings.mangas.finished
      Manga.finished.order(:name)
    when Settings.mangas.not_finished
      Manga.not_finished.order(:name)
    when Settings.mangas.most_followed
      Manga.most_followed
    else
      Manga.order_manga
    end
  end
end
