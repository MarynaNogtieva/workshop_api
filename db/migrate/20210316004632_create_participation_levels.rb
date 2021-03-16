class CreateParticipationLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :participation_levels do |t|
      t.string :name, null: false, limit: 100
      t.timestamps
    end
  end
end
