class AddFirstNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :company_name, :string
    add_column :users, :company_number, :string
    add_column :users, :company_address, :string
    add_column :users, :company_city, :string
    add_column :users, :company_postal_code, :string
    add_column :users, :company_country, :string
    add_column :users, :company_krs_number, :string
    add_column :users, :phone_number, :string
  end
end
