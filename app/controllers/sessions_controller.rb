class SessionsController < ApplicationController

  def login
    customer = Customer.find_by(email: params[:email])
    if customer && customer.authenticate(params[:password])
      token = JsonWebToken.encode(customer_id: customer.id)
      # contacts = user.contact


      # render json: { token: JsonWebToken.encode(customer_id: customer.id) }\

      render json: {
	      status: {
	        code: 200, message: 'Logged in successfully.',
	        data: { customer: CustomerSerializer.new(customer).serializable_hash[:data][:attributes], token: token}
	      }
    	}, status: :ok


    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private

  def generate_token(user_id)
    payload = { user_id: user_id }
    secret_key = Rails.application.secret_key_base

    JWT.encode(payload, secret_key, 'HS256')
  end
end
