class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :image
      t.string :content
      t.string :name
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
