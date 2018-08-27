class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @manga = Manga.find_by id: params[:followed_id]
    current_user.follow(@manga)
    respond_to do |format|
      format.html {redirect_to @manga}
      format.js
    end
  end

  def destroy
    @manga = Relationship.find_by(id: params[:id]).followed
    current_user.unfollow(@manga)
    respond_to do |format|
      format.html {redirect_to @manga}
      format.js
    end
  end
end
