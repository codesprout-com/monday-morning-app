class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])

    unless @room.users.pluck(:id).include?(current_user.id) || current_user.admin?
      redirect_to root_path
    end
  end
end