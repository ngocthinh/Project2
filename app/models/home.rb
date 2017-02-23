class Home < ApplicationRecord
  has_many :images, as: :target

  accepts_nested_attributes_for :images, allow_destroy: true

  enum language: {en: 0, vi: 1, ja: 2}
end
