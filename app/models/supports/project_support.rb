class Supports::ProjectSupport
  attr_reader :project

  def initialize project
    @project = project
  end

  def comments
    @project.comments
  end

  def likes current_user
    @project.likes.find_by(user_id: current_user.id) unless current_user.nil?
  end

  def images
    @project.images
  end

  def participates
    @project.participates.merge(Participate.accepted)
  end
end
