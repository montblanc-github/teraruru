class Public::NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.passive_notifications
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

  def destroy
    @notification = Notification.find(params[:id])
    if @notification.destroy
      flash[:notice] = "選択した通知を削除しました。"
      redirect_to user_notifications_path
    end
  end

  def destroy_all
    @notifications = current_user.passive_notifications
    if @notifications.present?
      @notifications.destroy_all
      flash[:notice] = "すべての通知を削除しました。"
      redirect_to user_notifications_path
    end
  end
end
