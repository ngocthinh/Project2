class Notification < ApplicationRecord
  belongs_to :user_create, class_name: User.name
  belongs_to :user
  belongs_to :notificationable, polymorphic: true

  scope :order_by_newest, ->{order created_at: :desc}
  scope :uncheck, ->{where(checked: false).count}
end
