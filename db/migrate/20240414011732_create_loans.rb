class CreateLoans < ActiveRecord::Migration[7.0]
  def change
    create_table :loans do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.string :state

      t.timestamps
    end
  end
end
