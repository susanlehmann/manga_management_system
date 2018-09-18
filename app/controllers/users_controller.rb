class UsersController < ApplicationController
  before_action :find_user

  def show; end

  def following
    @mangas = @user.following.paginate page: params[:page], per_page: Settings.mangas.page
    render :show_follow
  end

  private
  def find_user
    @user = User.find_by id: params[:id]
    redirect_to root_url if @user.nil?
  end
end
