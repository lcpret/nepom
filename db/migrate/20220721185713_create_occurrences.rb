class CreateOccurrences < ActiveRecord::Migration[7.0]
  def change
    create_table :occurrences do |t|
      t.string :occurrence_date
      t.string :occurrence_time
      t.string :last_name
      t.float :latitude
      t.float :longitude
      t.string :ship_origin
      t.string :ship_destination
      t.string :occurrence_type
      t.references :user, null: false, foreign_key: true
      t.references :ship, null: false, foreign_key: true

      t.timestamps
    end
  end
end
