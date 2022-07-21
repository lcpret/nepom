class AddFirstNameLastNameAdminCpfNumberDivisionToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :admin, :boolean
    add_column :users, :cpf, :string
    add_column :users, :number, :string
    add_column :users, :division, :string
  end
end
