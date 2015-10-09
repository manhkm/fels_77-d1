class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.text :content_jp

      t.timestamps null: false
    end
    add_index :words, :content_jp, unique: true
  end
end
