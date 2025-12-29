class AddForeignkey < ActiveRecord::Migration[6.0]
  def change
    add_reference :projects, :user, foreign_key: true
    add_reference :tasks, :project, foreign_key: true
  end
end
