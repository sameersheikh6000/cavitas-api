class CreateClientInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :client_infos do |t|
      t.string :subject
      t.string :description
      t.string :file
      t.integer :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
