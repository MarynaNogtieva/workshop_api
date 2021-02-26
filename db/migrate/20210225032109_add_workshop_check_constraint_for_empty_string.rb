class AddWorkshopCheckConstraintForEmptyString < ActiveRecord::Migration[5.2]
  def up
    execute("ALTER TABLE workshops
      DROP CONSTRAINT IF EXISTS non_empty_workshop_info_check;")
    execute("ALTER TABLE workshops ADD CONSTRAINT non_empty_workshop_info_check
       CHECK(title <> '' AND short_description <> '');")
  end

  def down
    execute("ALTER TABLE workshops
      DROP CONSTRAINT IF EXISTS non_empty_workshop_info_check;")
  end
end
