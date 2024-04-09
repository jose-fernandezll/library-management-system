class AddStateToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :state, :string
  end
end
