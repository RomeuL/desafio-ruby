class Despacho < ApplicationRecord
  belongs_to :armeiro, class_name: "Guarda", foreign_key: "armeiro_id"
  belongs_to :arma
  belongs_to :guarda

  validate :arma_disponivel_para_emprestimo, if: -> { tipo == "Empréstimo" }
  before_create :set_data_hora
  after_save :atualizar_status_arma

  private

  def set_data_hora
    self.data = Time.current
  end

  def atualizar_status_arma
    if tipo == "Empréstimo" || tipo == "Saída"
      arma.update!(emprestada: true)
    elsif tipo == "Devolução" || tipo == "Entrada"
      arma.update!(emprestada: false)
    end
  end

  def arma_disponivel_para_emprestimo
    errors.add(:arma, "já está emprestada!") if arma.emprestada? && tipo == "Empréstimo"
  end
end