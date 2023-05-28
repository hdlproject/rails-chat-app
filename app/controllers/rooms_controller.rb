class RoomsController < ApplicationController
  def index
    @user = helpers.current_user

    @items = helpers.get_formatted_room_rows(@user.rooms)

    render 'list'
  end

  def form
    @users = User.where.not(id: session[:user_id])

    render 'form'
  end

  def create
    sender = helpers.current_user
    receiver = User.find(room_member_params[:room_member])

    room = Room.create(room_params)
    room.members.push(sender)
    room.members.push(receiver)

    redirect_to rooms_path
  end

  def room_params
    params.require(:room).permit(:room_type)
  end

  def room_member_params
    params.require(:room).permit(:room_member)
  end
end
