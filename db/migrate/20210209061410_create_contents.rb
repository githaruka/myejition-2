class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.string :phrase,         null: false
      t.text :content_mean,     null: false
      t.text :phrase_reference, null: false
      t.references :dictionary, foreign_key: true
      t.timestamps
    end
  end
end
