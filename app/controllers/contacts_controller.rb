class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    @key = Settings.link_map + ENV["GOOGLE_API_KEY"]
  end

  def create
    @contact = Contact.create contact_params
    if @contact.save
      ContactMailer.contact_mailer(@contact).deliver_later
      flash[:success] = t ".success"
      redirect_to root_path
    else
      flash[:error] = t ".fail"
      render :new
    end
  end

  private
  def contact_params
    params.require(:contact).permit :name, :email, :title, :content
  end
end
