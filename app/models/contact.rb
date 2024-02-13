class Contact < ApplicationRecord
  belongs_to :customer
  has_many :interactions, dependent: :destroy
end
