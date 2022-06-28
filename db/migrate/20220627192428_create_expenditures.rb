class CreateExpenditures < ActiveRecord::Migration[7.0]
  def change
    create_table :expenditures do |t|
      t.integer :author_id, index: true
      t.integer :group_id, index: true
      t.string :name
      t.float :amount

      t.timestamps
    end

    add_foreign_key :expenditures, :users, column: :author_id, primary_key: :id
    add_foreign_key :expenditures, :groups, column: :group_id, primary_key: :id
  end
end
