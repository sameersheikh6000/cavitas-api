class UserSeralizer
    include FastJsonapi::ObjectSerializer
    attributes :id, :email, :role
    attribute :created_at do |user|
        user.created_at && user.created_at.strftime('%d/%m/%Y')
    end
end