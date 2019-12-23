module NotificationsHelper

	def notification_form(notification)
  	@comment=nil
  	visitor=link_to notification.visitor.name, notification.visitor, style:"font-weight: bold;"
  	your_memo=link_to 'あなたの投稿', notification.memo, style:"font-weight: bold;", remote: true
  	case notification.action
    	when "follow" then
    	  "#{visitor}があなたをフォローしました"
   		when "favorite" then
     		"#{visitor}が#{your_memo}にいいね！しました"
    	when "comment" then
     		@comment=Comment.find_by(id:notification.comment_id)&.comment
     		"#{visitor}が#{your_memo}にコメントしました"
  	end
	end

  def unchecked_notifications
   	@notifications=current_user.passive_notifications.where(checked: false)
  end
end
