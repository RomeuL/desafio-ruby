class CreateUnidades < ActiveRecord::Migration[8.0]
  def change
    create_table :unidades do |t|
      t.string :nome

      t.timestamps
    end
  end
end
