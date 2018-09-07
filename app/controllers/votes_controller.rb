class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_chapter, only: [:create, :destroy]

  def create
    @chapter.liked_by current_user
    respond_to do |format|
      format.html{redirect_to @chapter}
      format.js
    end
  end

  def destroy
    @chapter.disliked_by current_user
    respond_to do |format|
      format.html{redirect_to @chapter}
      format.js
    end
  end

  private

  def find_chapter
    @chapter = Chapter.find_by id: params[:chapter_id]
    redirect_to chapter_path unless @chapter
  end
end
