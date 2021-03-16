class AddUniqueConstraintToParticipationLevelName < ActiveRecord::Migration[5.2]
  def up
    safety_assured do
      execute("ALTER TABLE participation_levels
        ADD CONSTRAINT uniq_participation_levels_name UNIQUE (name);")
    end
  end

  def down
    safety_assured do
      execute('ALTER TABLE participation_levels
        DROP CONSTRAINT uniq_participation_levels_name;')
    end
  end
end
