class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.boolean :private_visibility, default: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
