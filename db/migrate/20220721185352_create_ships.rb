class CreateShips < ActiveRecord::Migration[7.0]
  def change
    create_table :ships do |t|
      t.string :name
      t.string :registration
      t.string :registration_port

      t.timestamps
    end
  end
end
