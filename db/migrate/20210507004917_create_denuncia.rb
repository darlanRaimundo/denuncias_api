class CreateDenuncia < ActiveRecord::Migration[6.1]
  def change
    create_table :denuncia do |t|
      t.string :descricao
      t.string :status
      t.integer :latitude
      t.integer :longitude
      t.string :usuario_criador
      t.string :medida

      t.timestamps
    end
  end
end
