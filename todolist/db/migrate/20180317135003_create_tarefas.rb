class CreateTarefas < ActiveRecord::Migration
  def change
    create_table :tarefas do |t|
      t.string :titulo
      t.text :nota
      t.date :data

      t.timestamps null: false
    end
  end
end
