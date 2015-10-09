class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.integer :progress
      t.references :user, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :lessons, [:name, :user_id, :course_id], unique: true
    add_index :lessons, [:user_id, :course_id, :created_at]
  end
end
