class ActivityChannel < ApplicationCable::Channel
  def subscribed
    manga = Manga.find_by id: params[:id]
    user = User.find_by id: params[:id]
    stream_from manga
  end

  def unsubscribed
    stop_all_streams
  end
end
