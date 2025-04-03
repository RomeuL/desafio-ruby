class Equipe < ApplicationRecord
  belongs_to :unidade
  has_many :guardas, dependent: :destroy
  validates :nome, presence: true, uniqueness: true
  validates :unidade_id, presence: true
end
