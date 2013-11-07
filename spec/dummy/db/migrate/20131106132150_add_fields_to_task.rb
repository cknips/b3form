class AddFieldsToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :done, :boolean
    add_column :tasks, :really_done, :boolean
    add_column :tasks, :category, :string
    add_column :tasks, :due_date, :date
    add_column :tasks, :public, :boolean
  end
end
