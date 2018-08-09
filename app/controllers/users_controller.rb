class UsersController < ApplicationController
  before_action :find_user

  def show; end

  private
  def find_user
    @user = User.find_by id: params[:id]
    redirect_to root_url if @user.nil?
  end
end
