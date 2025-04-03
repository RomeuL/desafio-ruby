class Guarda < ApplicationRecord
  belongs_to :equipe, optional: true

  # Certifique-se de que os atributos estão disponíveis
  validates :nome_completo, presence: true
  validates :matricula, presence: true, uniqueness: true
  validates :porte_arma, presence: true
end
