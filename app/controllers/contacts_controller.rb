class ContactsController < ApplicationController
  before_action :authenticate_request
  before_action :set_contact, only: [:show, :update, :destroy]

  def index
    @contacts = current_user.contacts
    render json: ContactSerializer.new(@contacts).serializable_hash, status: :ok
  end

  def show
    # render json: @contact, serializer: ContactSerializer
    render json: ContactSerializer.new(@contact).serializable_hash, status: :ok
  end

  def create
    @contact = current_user.contacts.build(contact_params)
    if @contact.save
      render json: @contact, serializer: ContactSerializer, status: :created
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def update
    if @contact.update(contact_params)
      render json: @contact, serializer: ContactSerializer
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def destroy
      if @contact.destroy
        render json: { message: 'Contact Destroyed Successfully' }, status: :ok
      else
        render json: { message: 'Failed to Destroy Contact' }, status: :unprocessable_entity
      end
  end


  private

  def set_contact
    @contact = current_user.contacts.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Record Not Found' }, status: :not_found
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :phone)
  end
end