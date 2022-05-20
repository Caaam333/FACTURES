class CreateFactures < ActiveRecord::Migration[6.1]
  def change
    create_table :factures do |t|
      t.references :recipent, null: false, foreign_key: true
      t.datetime :limite
      t.boolean :sold, default: false
      t.integer :price

      t.timestamps
    end
  end
end
