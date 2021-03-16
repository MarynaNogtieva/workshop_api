# frozen_string_literal: true

class WorkshopShowBlueprint < Blueprinter::Base
  identifier :id

  fields :title, :short_description, :long_description
end