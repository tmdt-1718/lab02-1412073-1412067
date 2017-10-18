class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :text
      t.string :image
      t.integer :receiver
      t.boolean :ispending
      t.boolean :isread
      t.datetime :time_read
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
