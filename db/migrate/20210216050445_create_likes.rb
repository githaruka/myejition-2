class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user, forreign_key: true
      t.references :dictionary, forreign_key: true
      t.timestamps
    end
  end
end
