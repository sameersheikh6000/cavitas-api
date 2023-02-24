class ClientInfo < ApplicationRecord
  belongs_to :user
  has_many :rejected_files

  enum status: {
    rejected: 0,
    approved: 1
  }
end
