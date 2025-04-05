class Guarda < ApplicationRecord
  belongs_to :equipe, optional: true

  validates :nome_completo, presence: true
  validates :matricula, presence: true, uniqueness: true
  validates :porte_arma, presence: true
end
