class UserSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :email, :role, :first_name, :last_name, :company_address, :company_city, :company_country, :company_krs_number, :company_name, :company_postal_code, :phone_number
    attribute :created_at do |user|
        user.created_at && user.created_at.strftime('%d/%m/%Y')
    end
end