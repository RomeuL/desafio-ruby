class Arma < ApplicationRecord
    validates :modelo , presence: true, uniqueness: true
    validates :registro, presence: true, uniqueness: true
end
