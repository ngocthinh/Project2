class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :attachments, dependent: :destroy
  has_many :likes, as: :target
  has_many :comments, as: :target
  has_many :notifications, as: :notificationable

  mount_uploader :image, ImageUploader

  delegate :name, to: :category, prefix: :category, allow_nil: true
  delegate :name, to: :user, prefix: :user, allow_nil: true

  validates :title, presence: true
  validates :content, presence: true

  enum target_type: {blog: 0, news: 1}

  scope :order_by_newest, ->{order created_at: :desc}
  scope :post_by_category_and_type, -> category_id, target_type do
    where category: category_id, target_type: target_type
  end
  scope :except_id, ->id do
    where("id != ?", id).limit Settings.related_item
  end

  ratyrate_rateable :rating
end
