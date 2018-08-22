class Admin::AnimesController < Admin::AdminController
  before_action :find_anime, only: [:edit, :update, :show, :destroy]
  load_and_authorize_resource

  def index
    @animes = Anime.paginate page: params[:page], per_page: Settings.animes.page
  end
  def show
  end

  def new
    @anime = Anime.new
  end

  def create
    @anime = Anime.new anime_params
    if @anime.save
      flash[:info] = t("anime_created")
      redirect_to admin_animes_path
    else
      flash[:alert] = t("anime_creating_error")
      render :new
    end
  end

  def edit
  end

  def update
    if @anime.update anime_params
      flash[:alert] = t("anime_updated")
      redirect_to admin_animes_path
    else
      flash[:alert] = t("anime_creating_error")
      render :edit
    end
  end

  def destroy
    if @anime.destroy
      flash[:success] = t(".animes_deleted")
      redirect_to admin_animes_path
    else
      flash[:danger] = t(".animes_not_deleted")
      render :index
    end
  end

  private

  def anime_params
    params.require(:anime).permit(:id, :video_thumbnail, :video_thumbnail_cache, :manga_id, :name, :published_at)
  end

  def find_anime
    @anime = Anime.find_by id: params[:id]
    redirect_to admin_animes_path if @anime.nil?
  end
end
