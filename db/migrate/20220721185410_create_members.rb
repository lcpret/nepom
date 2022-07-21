class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :cpf
      t.date :birth
      t.string :license_number
      t.string :doc_number
      t.string :doc_type

      t.timestamps
    end
  end
end
