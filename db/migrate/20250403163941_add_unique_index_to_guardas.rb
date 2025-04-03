class AddUniqueIndexToGuardas < ActiveRecord::Migration[6.1]
  def change
    add_index :guardas, :matricula, unique: true
    add_index :guardas, :porte_arma, unique: true
  end
end
