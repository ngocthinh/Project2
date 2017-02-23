class Certification < ApplicationRecord
  has_many :certificate_users, dependent: :destroy

  mount_uploader :image, ImageUploader
end
