class WorkshopsController < ApplicationController
  def index
    render(json: WorkshopsIndexBlueprint.render(workshops, root: :data),
           status: :ok)
  end

  def create; end

  def show; end

  private

  def workshops
    @workshops ||= \
      Workshop.
        all.
        limit(20).
        order("id DESC")
  end
end
