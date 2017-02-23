class ContactMailer < ApplicationMailer
  def contact_mailer contact
    @contact = contact
    mail to: @contact.email, subject: t("contact_cofirmation")
  end
end
