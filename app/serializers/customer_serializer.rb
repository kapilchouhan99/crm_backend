class CustomerSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :name

  attributes :contacts do |object|
    object&.contacts
  end

  attributes :interactions do |object|
    object&.interactions
  end

  
end
