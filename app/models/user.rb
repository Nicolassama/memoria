class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :notifications

  has_many :memos, dependent: :destroy

  has_many :comments

  has_many :favorites, dependent: :destroy

  has_many :contacts

  mount_uploader :image, ImageUploader


  # ====================自分がフォローしているユーザーとの関連 ===================================
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower
  # ========================================================================================

  # ====================自分がフォローされるユーザーとの関連 ===================================
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following
  # =======================================================================================

  # =======通知機能部分=======
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :visitors, through: :active_relationships, source: :visited
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  has_many :visiteds, through: :passive_relationships, source: :visitor



def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end




  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

  def already_liked?(memo)
    self.favorites.exists?(memo_id: memo.id)
  end
end
