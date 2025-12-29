class AddPartNumberToProject < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :part_number, :string
  end
end
