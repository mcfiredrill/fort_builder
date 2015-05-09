class PostSerializer < ActiveModel::Serializer
  attributes :id, :name, :body, :image_url
end
