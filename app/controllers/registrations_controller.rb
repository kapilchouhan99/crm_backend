# app/controllers/users_controller.rb
class RegistrationsController < ApplicationController
  def create
    customer = Customer.new(user_params)

    if customer.save
      token = JsonWebToken.encode(customer_id: customer.id)
      render json: {
        status: {
          code: 200, message: 'Signup successfully.',
        }
      }, status: :ok




    else
      render json: { errors: customer.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:customer).permit( :name, :email, :password)
  end
end
