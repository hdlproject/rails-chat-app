class ChatsController < ApplicationController
  def index
    if helpers.logged_in?
      @user = helpers.current_user

      @chats = Chat.where(room_id: params[:room_id])
      @members = User.where(id: params[:receiver_ids])

      @receiver_ids = params[:receiver_ids]
      @room_id = params[:room_id]

      render "list"
    else
      redirect_to login_path
    end
  end

  def show
    @chat = Chat.find(params[:id])

    render json: @chat
  end

  def create
    if helpers.logged_in?
      @user = helpers.current_user

      @chat = Chat.create(message: params[:message], sender_id: @user.id, room_id: params[:room_id])

      redirect_to controller: "chats", action: "index", room_id: params[:room_id], receiver_ids: params[:receiver_ids]
    else
      redirect_to login_path
    end
  end

  def update
    @chat = Chat.find(params[:id])
    @chat.update(message: params[:message])

    render json: "#{@chat.id} has been updated to #{@chat.message}"
  end

  def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy

    render json: "#{@chat.id} has been deleted"
  end
end
