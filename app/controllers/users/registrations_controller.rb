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
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end 
  
  def update_user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
