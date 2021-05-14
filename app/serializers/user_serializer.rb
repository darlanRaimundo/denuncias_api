class UserSerializer < ActiveModel::Serializer
  attributes :email, :name, :access_token, :client, :uid
end
