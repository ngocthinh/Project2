class Contact < ApplicationRecord
  validates :name, presence: true,
   length: {maximum: Settings.contact.name_length}
  validates :email, presence: true,
   length: {maximum: Settings.contact.email_length}
  validates :title, presence: true,
   length: {maximum: Settings.contact.title_length}
end
