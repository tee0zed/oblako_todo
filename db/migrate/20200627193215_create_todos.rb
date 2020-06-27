class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.references :project, null: false, foreign_key: true
      t.boolean :checked
      t.string :todoname

      t.timestamps
    end
  end
end
