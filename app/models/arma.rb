class Arma < ApplicationRecord
  belongs_to :guarda_atual, class_name: "Guarda", optional: true
  has_many :despachos
  
  validates :modelo , presence: true, uniqueness: true
  validates :registro, presence: true, uniqueness: true
end
