class ChatsController < ApplicationController
  def index
    @user = helpers.current_user
    @room_id = params[:room_id]

    @chats = Chat.where(room_id: @room_id)
    @members = User.where(id: params[:receiver_ids])

    render "list"
  end

  def create
    unless chat_params[:message].empty?
      user = helpers.current_user

      chat = Chat.new(chat_params)
      chat.sender_id = user.id
      if chat.save
        ChatsChannel.broadcast_to(chat.room, chat)
      end
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:message, :room_id)
  end
end
