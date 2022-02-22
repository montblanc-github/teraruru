module Public::NotificationsHelper
  def notification_form(notification)
    @comment = nil
    visiter = notification.visiter
    if !notification.visiter_id.nil?
      visiter = link_to visiter.account_name, user_path(visiter.id), class: "notice-link"
    end
    if !notification.article_id.nil?
      your_article = link_to "あなたの投稿", article_path(notification.article_id), class: "notice-link"
    end
    visiter_comment = notification.comment_id
    case notification.action
    when "hidden" then
      your_article + "は管理者によって非表示にされました。"
    when "delete" then
      "あなたの投稿1点が管理者によって削除されました。"
    when "follow" then
      visiter + "があなたをフォローしました。"
    when "favorite" then
      visiter + "が" + your_article + "にいいねしました。"
    when "comment" then
      @comment = Comment.find_by(id: visiter_comment)&.content
      visiter + "が" + your_article + "にコメントしました。"
    end
  end

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end

  def checked_notification_user(notification)
    notification.visited != notification.visiter
  end
end
