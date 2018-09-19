class MangasController < ApplicationController
  before_action :get_manga, only: [:show]

  def index
    @mangas = Manga.order_manga.paginate page: params[:page], per_page: Settings.mangas.page
    if params[:search].present?
      @mangas = Manga.search(name_cont: params[:search]).result.paginate page: params[:page], per_page: Settings.mangas.page
      if params[:scope].present?
        check_scope.search(name_cont: params[:search]).result.paginate page: params[:page], per_page: Settings.mangas.page
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
      Manga.most_view.paginate page: params[:page], per_page: Settings.mangas.page
    when Settings.mangas.top_rate
      Manga.top_rate.paginate page: params[:page], per_page: Settings.mangas.page
    when Settings.mangas.finished
      Manga.finished.order(:name).paginate page: params[:page], per_page: Settings.mangas.page
    when Settings.mangas.not_finished
      Manga.not_finished.order(:name).paginate page: params[:page], per_page: Settings.mangas.page
    when Settings.mangas.most_followed
      Manga.most_followed.paginate page: params[:page], per_page: Settings.mangas.page
    else
      Manga.order_manga.paginate page: params[:page], per_page: Settings.mangas.page
    end
  end
end
