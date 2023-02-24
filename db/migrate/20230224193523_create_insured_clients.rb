class CreateInsuredClients < ActiveRecord::Migration[7.0]
  def change
    create_table :insured_clients do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.references :client_info

      t.timestamps
    end
  end
end
