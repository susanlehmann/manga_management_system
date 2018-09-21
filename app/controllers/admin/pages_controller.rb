class Admin::PagesController < Admin::AdminController
  before_action :find_page, only: [:edit, :update, :show, :destroy]
  load_and_authorize_resource

  def index
    @pages = Page.all.paginate page: params[:page], per_page: Settings.pages.page
  end

  def show
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new page_params
    if @page.save
      flash[:info] = t("page_created")
      redirect_to admin_pages_path
    else
      flash[:alert] = t("page_creating_error")
      render :new
    end
  end

  def edit
  end

  def update
    if @page.update page_params
      flash[:alert] = t("page_updated")
      redirect_to admin_pages_path
    else
      flash[:alert] = t("page_creating_error")
      render :edit
    end
  end

  def destroy
    if @page.destroy
      flash[:success] = t(".pages_deleted")
      redirect_to admin_pages_path
    else
      flash[:danger] = t(".pages_not_deleted")
      render :index
    end
  end

  private

  def page_params
    params.require(:page).permit(:id, :chapter_id, :image)
  end

  def find_page
    @page = Page.find_by id: params[:id]
    redirect_to admin_pages_path if @page.nil?
  end
end
