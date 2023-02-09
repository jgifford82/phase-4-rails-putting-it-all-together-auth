class UserSerializer < ActiveModel::Serializer
  # attributes :id, :username, :password_digest, :image_url, :bio
  attributes :id, :username, :image_url, :bio
end
