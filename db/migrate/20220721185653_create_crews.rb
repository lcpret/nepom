class CreateCrews < ActiveRecord::Migration[7.0]
  def change
    create_table :crews do |t|
      t.references :members, null: false, foreign_key: true
      t.references :ships, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.string :role

      t.timestamps
    end
  end
end
