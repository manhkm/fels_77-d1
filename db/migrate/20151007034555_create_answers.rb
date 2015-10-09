class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :word_id
      t.text :content
      t.boolean :correct_answer

      t.timestamps null: false
    end
  end
end
