class VoteMangasController < ApplicationController
  before_action :authenticate_user!
  before_action :find_manga,only: [:create,:destroy]

  def create
    @manga.liked_by current_user
    respond_to do |format|
      format.html{redirect_to @manga}
      format.js
    end
  end

  def destroy
    @manga.disliked_by current_user
    respond_to do |format|
      format.html{redirect_to @manga}
      format.js
    end
  end

  private

  def find_manga
    @manga = Manga.find_by id: params[:manga_id]
    redirect_to manga_path unless @manga
  end
end
