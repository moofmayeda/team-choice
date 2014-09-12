class PinSerializer < ActiveModel::Serializer
  attributes :name, :address
  has_many :users
end
