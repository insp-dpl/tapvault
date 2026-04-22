class Customers::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def sign_up_params
    params.require(:customer).permit(:email, :password, :password_confirmation,
                                      :first_name, :last_name, :phone)
  end

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
        status: { code: 200, message: 'Customer signed up successfully.' },
        data: resource.as_json(except: [:encrypted_password])
      }
    else
      render json: {
        status: { message: "Customer couldn't be created. #{resource.errors.full_messages.join(', ')}" }
      }, status: :unprocessable_entity
    end
  end
end