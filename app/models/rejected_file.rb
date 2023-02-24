class RejectedFile < ApplicationRecord
  belongs_to :user
  belongs_to :client_info
end
