class AddOnDeleteCascadeToForeignKey < ActiveRecord::Migration[7.0]
  def change
    change_table :group_expenses do |t|
      t.remove_foreign_key column: :expense_id
      t.remove_foreign_key column: :group_id
      t.foreign_key :expenses, column: :expense_id, on_delete: :cascade
      t.foreign_key :groups, column: :group_id, on_delete: :cascade
    end
  end
end
