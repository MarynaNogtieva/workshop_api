class ValidateTitleShortDescriptionNotNull < ActiveRecord::Migration[5.2]
  def change
    safety_assured do
      execute 'ALTER TABLE "workshops" VALIDATE CONSTRAINT "workshops_title_null"'
      execute 'ALTER TABLE "workshops" VALIDATE CONSTRAINT "workshops_short_description_null"'
    end

    # in Postgres 12+, you can then safely set NOT NULL on the column
    # change_column_null :workshops, :title, false
    # change_column_null :workshops, :short_description, false
    # safety_assured do
    #   execute 'ALTER TABLE "users" DROP CONSTRAINT IF EXISTS "workshops_title_null"'
    #   execute 'ALTER TABLE "users" DROP CONSTRAINT IF EXISTS "workshops_short_description_null"'
    # end
  end
end
