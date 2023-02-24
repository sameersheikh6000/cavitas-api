class ClientInfo < ApplicationRecord
  belongs_to :user
  has_many :rejected_files
  after_create :read_file
  mount_uploader :file, DataFileUploader

  enum status: {
    rejected: 0,
    approved: 1
  }

  def read_file
    ReadFileService.new.read_file(self)
  end
end
