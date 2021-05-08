class DenunciaSerializer < ActiveModel::Serializer
  attributes :id, :descricao, :status, :latitude, :longitude, :usuario_criador
end
