class Participate < ApplicationRecord
  belongs_to :user
  belongs_to :project

  scope :accepted, ->{where is_accept: true}
end
