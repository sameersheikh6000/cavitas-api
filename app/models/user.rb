class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  has_many :client_infos
  has_many :rejected_files
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

  enum role: {
    admin: 0,
    user: 1
  }

  def jwt_payload
    super
  end
end
