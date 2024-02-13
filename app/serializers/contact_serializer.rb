class ContactSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :email, :phone, :created_at, :updated_at

  attribute :interactions do |object|
    object&.interactions
  end
end
