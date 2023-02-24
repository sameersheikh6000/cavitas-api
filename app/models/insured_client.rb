class InsuredClient < ApplicationRecord
    belongs_to :client_info, optional: true
end
