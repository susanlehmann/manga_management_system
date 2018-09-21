class CommentsController < ApplicationController
  before_action :find_comment, only: [:destroy]

  def create
    if params[:comment][:parent_id].present?
      parent = Comment.find_by id: params[:comment].delete(:parent_id)
      return unless parent
      @comment = parent.children.build comment_params
    else
      @comment = Comment.new comment_params
    end

    if @comment.save
      respond_to do |format|
        format.html{redirect_back(fallback_location: root_path)}
        format.js{flash.now[:success] = t(".success_comment")}
      end
    end
  end

  def destroy
    ActiveRecord::Base.transaction do
      @comment.descendants.each do |comment_des|
        comment_des.destroy
      end
      @comment.destroy
      flash[:success] = t "comment_deleted"
      redirect_back(fallback_location: root_path)
    end

    rescue ActiveRecord::RecordInvalid
      flash[:danger] = t "can_not_delete_comment"
      redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
    params.require(:comment).permit :manga_id, :user_id, :content, :parent_id
  end

  def find_comment
    @comment = Comment.find_by id: params[:id]
    redirect_back(fallback_location: root_path) unless @comment
  end
end
