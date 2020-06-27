class AddDefaultValueToCheckedTodos < ActiveRecord::Migration[6.0]
  def change
    change_column :todos, :checked, :boolean, default: false
  end
end
