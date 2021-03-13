class WorkshopsController < ApplicationController
  def index
    @pagy, @workshops = pagy(workshops, page: params[:page_number] ,items: params[:limit])
    render(json: WorkshopsIndexBlueprint.render(@workshops, root: :data),
           status: :ok)
  end

  def create; end

  def show; end

  private

  def workshops
    Workshop.recent.limit(50)
  end
end
