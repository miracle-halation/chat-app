class MessagesController < ApplicationController
  def index
    @rooms = Room.where(id: current_user.room_ids)
  end
end
