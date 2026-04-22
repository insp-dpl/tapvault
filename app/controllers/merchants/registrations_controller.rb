class Merchants::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def sign_up_params
    params.require(:merchant).permit(:email, :password, :password_confirmation,
                                      :business_name, :phone, :address, :country)
  end

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
        status: { code: 200, message: 'Merchant signed up successfully. Awaiting approval.' },
        data: resource.as_json(except: [:encrypted_password])
      }
    else
      render json: {
        status: { message: "Merchant couldn't be created. #{resource.errors.full_messages.join(', ')}" }
      }, status: :unprocessable_entity
    end
  end
end