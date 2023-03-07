class ChangeColumnInClientInfos < ActiveRecord::Migration[7.0]
  def change
    change_column_default :client_infos, :status, from: nil, to: 0
  end
end
