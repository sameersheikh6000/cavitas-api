class ClientInfo < ApplicationRecord
  belongs_to :user
  has_one :rejected_file
  after_update :read_file, if: :status_changed?
  mount_uploader :file, DataFileUploader

  scope :pending, -> { where(status:  0) } 
  scope :rejected, -> { where(status:  1) } 
  scope :accepted, -> { where(status:  2) } 

  enum status: {
    pending: 0,
    rejected: 1,
    accepted: 2
    }

  def read_file
    if self.status == 'accepted'
      ReadFileService.new.read_file(self)
    end
  end
end
