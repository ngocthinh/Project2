class Image < ApplicationRecord
  belongs_to :target, polymorphic: true

  mount_uploader :image, ImageUploader,
    reject_if: proc{ |param| param[:image].blank? && param[:image_cache].blank? &&
    param[:id].blank? }, allow_destroy: true
end
