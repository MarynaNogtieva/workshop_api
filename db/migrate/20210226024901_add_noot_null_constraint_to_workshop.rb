class AddNootNullConstraintToWorkshop < ActiveRecord::Migration[5.2]
  def up
    safety_assured do
      execute 'ALTER TABLE "workshops" ADD CONSTRAINT "workshops_title_null" CHECK ("title" IS NOT NULL) NOT VALID'
      execute 'ALTER TABLE "workshops" ADD CONSTRAINT "workshops_short_description_null" CHECK ("short_description" IS NOT NULL) NOT VALID'
    end
  end

  def down
    safety_assured do
      execute 'DROP CONSTRAINT IF EXISTS workshops_title_null'
      execute 'DROP CONSTRAINT IF EXISTS workshops_short_description_null'
    end
  end
end
