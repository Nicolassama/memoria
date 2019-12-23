class Memo < ApplicationRecord

  #before_action :authenticate_user!, except: [:index, :show]


	has_many :comments

	has_many :favorites

	belongs_to :user, dependent: :destroy

	has_many :liked_users, through: :favorites, source: :users


  has_many :notifications, dependent: :destroy

	validates :title, presence: true, length: { in: 1..30 }
  validates :body, presence: true, length: { in: 1..1000 }

  def already_liked?(memo)
    self.favorites.exists?(memo_id: memo.id)
  end

	def self.search(search)
    if search
      Memo.where(['title LIKE ?', "%#{search}%"])
    else
      Memo.all
    end
  end

  def create_notification_like!(current_user)
      # すでに「いいね」されているか検索
      temp = Notification.where(["visitor_id = ? and visited_id = ? and memo_id = ? and action = ? ", current_user.id, user_id, id, 'favorite'])
      # いいねされていない場合のみ、通知レコードを作成
      if temp.blank?
        notification = current_user.active_notifications.new(
          memo_id: id,
          visited_id: user_id,
          action: 'favorite'
        )
        # 自分の投稿に対するいいねの場合は、通知済みとする
        notification.save if notification.valid?
      end
    end

def create_notification_comment!(current_user, comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Comment.select(:user_id).where(memo_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      memo_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    
    notification.save if notification.valid?
  end







end
