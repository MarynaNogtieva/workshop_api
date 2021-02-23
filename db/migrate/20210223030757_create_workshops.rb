class CreateWorkshops < ActiveRecord::Migration[5.2]
  def change
    create_table :workshops do |t|
      t.string :title
      t.text :short_description
      t.text :long_description

      t.timestamps
    end
  end
end
