class Public::ChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :follow_each_other, only: [:show]

  def show
    @user = User.find(params[:id])
    rooms = current_user.user_rooms.pluck(:room_id)
    user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms)

    if user_rooms.nil?
      @room = Room.new
      @room.save
      UserRoom.create(user_id: @user.id, room_id: @room.id)
      UserRoom.create(user_id: current_user.id, room_id: @room.id)
    else
      @room = user_rooms.room
    end

    @chats = @room.chats
    @chat = Chat.new(room_id: @room.id)
  end

  def create
    @chat = current_user.chats.new(chat_params)
    @chat.save
  end

  private

  def chat_params
    params.require(:chat).permit(:content, :room_id)
  end

  def follow_each_other
    user = User.find(params[:id])
    if !(current_user.following?(user) && user.following?(current_user))
      flash[:notice] = "相互フォローしている場合のみ、ダイレクトメッセージ機能をご利用いただけます。"
      redirect_to request.referer
    end
  end

end
