class RoomsController < ApplicationController
  def index
    if helpers.logged_in?
      @user = helpers.current_user

      @items = []
      @user.rooms.each do |room|
        @item = {
          text: "[%s] %s" % [room.room_type, room.members.map { |member| member.name }.join(" - ")],
          room_id: room.id,
          receiver_ids: room.members.map { |member| member.id if member.id != @user.id }
        }
        @items.push(@item)
      end

      render "list"
    else
      redirect_to login_path
    end
  end

  def form
    if helpers.logged_in?
      @users = User.where.not(id: session[:user_id])

      render "form"
    else
      redirect_to login_path
    end
  end

  def create
    if helpers.logged_in?
      @user = helpers.current_user
      @receiver = User.find(params[:room_member])
      @room = Room.create(room_type: params[:room_type])
      @room.members.push(@user)
      @room.members.push(@receiver)

      redirect_to :controller => "rooms", :action => "index"
    else
      redirect_to login_path
    end
  end
end
