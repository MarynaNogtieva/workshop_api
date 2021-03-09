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
      Workshop
        .recent
        .limit(20)
  end
end
