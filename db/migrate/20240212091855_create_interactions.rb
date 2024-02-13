class CreateInteractions < ActiveRecord::Migration[7.0]
  def change
    create_table :interactions do |t|
      t.text :description
      t.datetime :date_time
      t.string :interaction_type
      t.string :status
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
