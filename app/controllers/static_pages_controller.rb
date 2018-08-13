class StaticPagesController < ApplicationController
  before_action :show_categories

  def home
  end

  def contact
  end

  private
  def show_categories
    @categories = Category.all
  end
end
