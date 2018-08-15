class CategoriesController < ApplicationController
  before_action :get_category, only: [:show]

  def index
    @categories = Category.all
  end

  def show
    @mangas = @category.mangas.all
  end

  private
  def get_category
    @category = Category.find_by id: params[:id]
    if @category.nil?
      redirect_to root_url
    end
  end
end
