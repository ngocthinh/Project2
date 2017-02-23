class StaticPagesController < ApplicationController
  def home
    @contact = Contact.new
    @key = Settings.link_map + ENV["GOOGLE_API_KEY"]
    @projects = Project.show_for_rating.take Settings.limit_project
    @home = Home.en.last
    if params[:locale] == Settings.language.vi
      @home = Home.vi.last unless Home.vi.last.nil?
    elsif params[:locale] == Settings.language.ja
      @home = Home.ja.last unless Home.ja.last.nil?
    end
  end
end
