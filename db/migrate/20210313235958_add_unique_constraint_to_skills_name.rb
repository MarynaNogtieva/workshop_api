class AddUniqueConstraintToSkillsName < ActiveRecord::Migration[5.2]
  def up
    safety_assured do
      execute("ALTER TABLE skills
      ADD CONSTRAINT uniq_skills_name UNIQUE (name);")
    end
  end

  def down
    safety_assured do
      execute("ALTER TABLE skills DROP CONSTRAINT uniq_skills_name;")
    end
  end
end
