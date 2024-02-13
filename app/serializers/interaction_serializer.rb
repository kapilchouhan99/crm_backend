class InteractionSerializer
  include JSONAPI::Serializer
  attributes :id, :description, :date_time, :interaction_type, :status, :contact_id

  belongs_to :contact
  
end
