class CreateRejectedFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :rejected_files do |t|
      t.references :user, null: false, foreign_key: true
      t.references :client_info, null: false, foreign_key: true
      t.string :reason_of_rejection

      t.timestamps
    end
  end
end
