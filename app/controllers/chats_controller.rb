class ChatsController < ApplicationController
  def index
    @chats = Chat.all

    render json: @chats
  end

  def show
    @chat = Chat.find(params[:id])

    render json: @chat
  end

  def create
    @chat = Chat.create(message: params[:message], sender_id: params[:sender_id], receiver_id: params[:receiver_id], receiver_type: params[:receiver_type])

    render json: @chat
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
