class Users::RegistrationsController < Devise::RegistrationsController

  respond_to :json
 
  def create
   super
  end

  
  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
        status: {code: 200, message: 'Signed up successfully.'},
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }
    else
      render json: {
        status: {message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}"}
      }, status: :unprocessable_entity
    end
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role, :first_name, :last_name, :company_name, :company_address, :company_city, :company_postal_code, :company_country, :company_krs_number)
  end 
  
  def update_user_params
    params.require(:user).permit(:password, :password_confirmation, :first_name, :last_name, :company_name, :company_krs_number, :company_address, :company_city, :company_postal_code, :company_country)
  end
end
