class Unidade < ApplicationRecord
  validates :nome, presence: true  
  has_many :equipes, dependent: :destroy
  end
  