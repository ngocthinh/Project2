class Admin::StaticPagesController < Admin::AdminController
  before_action :authenticate_user!
    def index
    end
end
