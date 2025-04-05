class Despacho < ApplicationRecord
  belongs_to :armeiro, class_name: "Guarda", foreign_key: "armeiro_id"
  belongs_to :arma
  belongs_to :guarda

  validate :arma_disponivel_para_emprestimo, if: -> { tipo == "Empréstimo" }
  validate :validar_devolucao, if: -> { tipo == "Devolução" }
  validate :validar_justificativa_se_necessario, if: -> { tipo == "Devolução" }
  before_create :set_data_hora
  
  def save_with_arma_update
    Despacho.transaction do
      if save
        atualizar_status_arma
        true
      else
        false
      end
    end
  end

  private

  def set_data_hora
    self.data = Time.current
  end

  def atualizar_status_arma
    if tipo == "Empréstimo"
      arma.update!(emprestada: true, guarda_atual_id: guarda_id)
    elsif tipo == "Devolução"
      arma.update!(emprestada: false, guarda_atual_id: nil)
    end
  end

  def arma_disponivel_para_emprestimo
    errors.add(:arma, "já está emprestada!") if arma.emprestada? && tipo == "Empréstimo"
  end

  def validar_devolucao
    
    unless arma.emprestada?
      errors.add(:arma, "não está emprestada e, portanto, não pode ser devolvida")
      return
    end
    
    if arma.guarda_atual_id != guarda_id
      errors.add(:base, "Esta arma foi emprestada para outro guarda e só pode ser devolvida por ele")
    end
  end

  def validar_justificativa_se_necessario
    
    ultimo_emprestimo = Despacho.where(arma_id: arma_id, tipo: "Empréstimo").order(created_at: :desc).first
    
    if ultimo_emprestimo.present?
      balas_alteradas = ultimo_emprestimo.quantidade_balas != quantidade_balas
      carregadores_alterados = ultimo_emprestimo.quantidade_carregadores != quantidade_carregadores
      
      if (balas_alteradas || carregadores_alterados) && justificativa.blank?
        errors.add(:justificativa, "necessária devido a alterações nas quantidades de balas ou carregadores")
      end
    end
  end
end