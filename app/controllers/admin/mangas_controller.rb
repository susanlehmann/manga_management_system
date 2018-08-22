class Admin::MangasController < Admin::AdminController
  before_action :find_manga, only: [:edit, :update, :show, :destroy]
  load_and_authorize_resource

  def index
    @mangas = Manga.order_manga.paginate page: params[:page], per_page: Settings.mangas.page
  end

  def show
  end

  def new
    @manga = Manga.new
  end

  def create
    @manga = Manga.new manga_params
    if @manga.save
      flash[:info] = t("manga_created")
      redirect_to admin_mangas_path
    else
      flash[:alert] = t("manga_creating_error")
      render :new
    end
  end

  def edit
  end

  def update
    if @manga.update manga_params
      flash[:alert] = t("manga_updated")
      redirect_to admin_mangas_path
    else
      flash[:alert] = t("manga_creating_error")
      render :edit
    end
  end

  def destroy
    if @manga.destroy
      flash[:success] = t(".mangas_deleted")
      redirect_to admin_mangas_path
    else
      flash[:danger] = t(".mangas_not_deleted")
      render :index
    end
  end

  private

  def manga_params
    params.require(:manga).permit(:name, :detail, :poster,
      :poster_cache, :thumbnail, :thumbnail_cache, :country, category_ids: [])
  end

  def find_manga
    @manga = Manga.find_by id: params[:id]
    redirect_to admin_mangas_path if @manga.nil?
  end
end
