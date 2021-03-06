class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.string :title
      t.text :body
      t.timestamp :timestamp
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
