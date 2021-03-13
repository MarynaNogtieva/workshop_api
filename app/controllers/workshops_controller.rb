# frozen_string_literal: true
class WorkshopsController < ApplicationController
  def index
    limit = params[:limit].present? ? params[:limit] : 20
    @pagy, @workshops = pagy(workshops, page: params[:page_number], items: limit)

    render(
      json: WorkshopsIndexBlueprint.render(@workshops, root: :data),
      status: :ok,
    )
  end

  def create; end

  def show; end

  private

  def workshops
    Workshop.recent.limit(50)
  end
end
