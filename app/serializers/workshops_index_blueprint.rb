# frozen_string_literal: true

class WorkshopsIndexBlueprint < Blueprinter::Base
  identifier :id

  fields :title, :short_description, :long_description
end