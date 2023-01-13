class HomeController < ApplicationController
  def index
    if current_user
      @current_room = current_user.rooms.order(created_at: :desc).limit(1).first
    end
  end
end
