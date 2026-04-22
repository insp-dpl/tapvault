class Merchants::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: {
      status: { code: 200, message: 'Logged in successfully.' },
      data: resource.as_json(except: [:encrypted_password])
    }
  end

  def respond_to_on_destroy
    if request.headers['Authorization'].present?
      render json: { status: 200, message: 'Logged out successfully.' }
    else
      render json: { status: 401, message: "Couldn't find an active session." }, status: :unauthorized
    end
  end
end