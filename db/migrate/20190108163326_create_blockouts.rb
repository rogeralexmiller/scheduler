class CreateBlockouts < ActiveRecord::Migration[5.2]
  def change
    create_table :blockouts do |t|
      t.references :user, foreign_key: true, null: false
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.datetime :last_occurrence
      t.text :rrule
      t.datetime :exdate, array: true, default: []
      t.references :parent, foreign_key: { to_table: :blockouts }
      t.text :reason

      t.timestamps
    end
  end
end
