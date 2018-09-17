class EventsController < ApplicationController
  def index
    @events = Event.all.where(recipient_id: current_user.id).reverse
  end
end
