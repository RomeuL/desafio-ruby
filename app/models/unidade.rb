class Unidade < ApplicationRecord
    has_many :equipes, dependent: :destroy
  end
  