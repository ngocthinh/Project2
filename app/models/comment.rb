class Comment < ApplicationRecord
  belongs_to :target, polymorphic: true

  scope :order_by_newest, ->{order created_at: :desc}
end
